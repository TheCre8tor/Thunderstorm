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
    
    var title: String = "Thunderstorm"
    
    var addLocationTitle: String = "Add a Location"
    
    @Published private(set) var locationCellViewModels: [LocationCellViewModel] = []
    
    var addLocationViewModel: AddLocationViewModel { 
        AddLocationViewModel(geocodingService: GeocodingClient())
    }
    
    // MARK: -
    
    func start() {
        UserDefaults.standard.publisher(for: \.locations)
            .compactMap { $0 }
            .decode(type: [Location].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .map { $0.map { LocationCellViewModel(location: $0) } }
            .eraseToAnyPublisher()
            .assign(to: &$locationCellViewModels)
    }
}
