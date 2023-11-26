//
//  LocationsViewModel.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 18/11/2023.
//

import Foundation

@MainActor
struct LocationsViewModel {
    var title: String = "Thunderstorm"
    
    var addLocationTitle: String = "Add a Location"
    
    var locationCellViewModels: [LocationCellViewModel] {
        Location.previews.map { LocationCellViewModel(location: $0) }
        // Location.previews().map(LocationCellViewModel.init)
    }
    
    var addLocationViewModel: AddLocationViewModel { 
        AddLocationViewModel(geocodingService: GeocodingClient())
    }
}
