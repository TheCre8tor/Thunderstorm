//
//  AddLocationViewModel.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 21/11/2023.
//

import Combine
import Foundation

@MainActor
internal final class AddLocationViewModel: ObservableObject {
    // MARK: - Type
    
    enum State: Equatable {
        case empty
        case querying
        case message(String)
        case results([AddLocationCellViewModel])
    }
    
    // MARK: - State
    
    @Published private(set) var state: State = .empty
    
    @Published var query = ""
    
    @Published private var isQuerying: Bool = false
    
    @Published private(set) var locations: [Location] = []
    
    // MARK: - Properties
    
    private let geocodingService: GeocodingService
    
    var textFieldPlaceholder: String = "Enter the name of a city ..."
    
    private var subscription: Set<AnyCancellable> = []
    
    // MARK: - Initialization
    
    init(geocodingService: GeocodingService) {
        self.geocodingService = geocodingService
        setupBindings()
    }
    
    // MARK: - Public API
    
    func addLocation(with id: String) -> Void {
        guard let location = locations.first(where: { $0.id == id}) else {
            return
        }
        
        // Add Location
        do {
            try UserDefaults.standard.addLocation(location)
        } catch {
            print("Unable to Add Location \(error)")
        }
    }
    
    // MARK: - Helper Methods
    
    private func setupBindings() {
        $query
            .throttle(for: 1.0, scheduler: RunLoop.main, latest: true)
            .filter { !$0.isEmpty }
            .sink { [weak self] addressString in
                self?.geocodeAddressString(addressString)
            }.store(in: &subscription)
        
        $locations
            .map { $0.map(AddLocationCellViewModel.init) }
            .combineLatest($query, $isQuerying)
            .map { viewModels, query, isQuerying -> State in
                if isQuerying {
                    return .querying
                }
                
                if query.isEmpty {
                    return .empty
                }
                
                if viewModels.isEmpty {
                    return .message("No matches found...")
                } else {
                    return .results(viewModels)
                }
            }
            .eraseToAnyPublisher()
            .removeDuplicates()
            .assign(to: &$state)
    }
    
    private func geocodeAddressString(_ addressString: String) {
        isQuerying = true
        
        Task {
            do {
                locations = try await geocodingService.geocodeAddressString(addressString)
            } catch {
                locations = []
                print("Unable to Geocode \(addressString) \(error)")
            }
            
            isQuerying = false
        }
    }
}
