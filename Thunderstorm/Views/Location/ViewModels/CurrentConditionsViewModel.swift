//
//  CurrentConditionsViewModel.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 19/11/2023.
//

import Foundation

struct CurrentConditionsViewModel {
    // MARK: - Properties
    
    private let currently: WeatherData.CurrentConditions
    
    private let measurementFormatter = ClearSkyFormatter()
    
    // MARK: - Public API
    
    var summary: String {
        currently.summary
    }
    
    var windSpeed: String {
        measurementFormatter.formatWindSpeed(currently.windSpeed)
    }
    
    var temperature: String {
        measurementFormatter.formatTemperature(currently.temperature)
    }
    
    // MARK: - Initialization
    
    init(currently: WeatherData.CurrentConditions) {
        self.currently = currently
    }
    
}
