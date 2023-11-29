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
        CurrentConditionsViewModel(currently: WeatherData.preview.currently)
    }
    
    var forecastViewModel: ForecastViewModel {
        ForecastViewModel(forecast: WeatherData.preview.forecast)
    }
    
    var locationName: String {
        location.name
    }
    
    // MARK: - Initialization
    
    init(location: Location) {
        self.location = location
    }
}
