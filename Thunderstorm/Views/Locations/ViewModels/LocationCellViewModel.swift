//
//  LocationCellViewModel.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 19/11/2023.
//

import Foundation

// This serves as an `entity` in DDD
struct LocationCellViewModel: Identifiable {
    // MARK: - Properties
    private let location: Location
    
    // MARK: - Identifiable
    var id: String { location.id }
    
    // MARK: - Initialization
    init(location: Location) {
        self.location = location
    }
    
    // MARK: - Public API
    var locationName: String { location.name }
    
    var locationCountry: String { location.country }
    
    var summary: Optional<String> = "Clear"
    
    var windSpeed: Optional<String> = "10 mi/h"
    
    var temperature: Optional<String> = "90 °F"
}
