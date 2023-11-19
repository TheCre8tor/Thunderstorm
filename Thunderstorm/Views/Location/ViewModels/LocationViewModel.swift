//
//  LocationViewModel.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 19/11/2023.
//

import Foundation

struct LocationViewModel {
    // MARK: - Properties
    
    private let location: Location
    
    var currentConditionsViewModel: CurrentConditionsViewModel {
        CurrentConditionsViewModel()
    }
    
    var forecastViewModel: ForecastViewModel {
        ForecastViewModel()
    }
    
    // MARK: - Initialization
    
    init(location: Location) {
        self.location = location
    }
}
