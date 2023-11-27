//
//  LocationsViewModel.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 18/11/2023.
//

import Foundation

@MainActor
final class LocationsViewModel: ObservableObject {
    // MARK: - Properties
    
    private let store: Store
    
    var title: String = "Thunderstorm"
    
    var addLocationTitle: String = "Add a Location"
    
    @Published private(set) var locationCellViewModels: [LocationCellViewModel] = []
    
    var addLocationViewModel: AddLocationViewModel { 
        AddLocationViewModel(store: store, geocodingService: GeocodingClient())
    }
    
    // MARK: - Initializer
    
    init(store: Store) {
        self.store = store
    }
    
    // MARK: - Public API
    
    func start() {
        store.locationsPublisher
            .map { $0.map { LocationCellViewModel(location: $0) } }
            .eraseToAnyPublisher()
            .assign(to: &$locationCellViewModels)
    }
}
