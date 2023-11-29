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
    
    private let weatherService: WeatherService
    
    var title: String = "Thunderstorm"
    
    var addLocationTitle: String = "Add a Location"
    
    @Published private(set) var locationCellViewModels: [LocationCellViewModel] = []
    
    var addLocationViewModel: AddLocationViewModel { 
        AddLocationViewModel(store: store, geocodingService: GeocodingClient())
    }
    
    // MARK: - Initializer
    
    init(store: Store, weatherService: WeatherService) {
        self.store = store
        self.weatherService = weatherService
    }
    
    // MARK: - Public API
    
    func start() {
        let weatherService = self.weatherService
        
        store.locationsPublisher
            .map { locations in
                locations.map { location in
                    LocationCellViewModel(
                        location: location,
                        service: weatherService
                    )
                }
            }
            .eraseToAnyPublisher()
            .assign(to: &$locationCellViewModels)
    }
}
