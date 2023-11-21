//
//  AddLocationCellViewModel.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 21/11/2023.
//

import Foundation

struct AddLocationCellViewModel {
    // MARK: - Properties
    
    private let location: Location
    
    // MARK: - Initializer
    
    init(location: Location) {
        self.location = location
    }
    
    // MARK: - Public API
    
    var name: String {
        location.name
    }
    
    var country: String {
        location.country
    }
    
    var coordinates: String {
        "\(location.latitude), \(location.longitude)"
    }
}
