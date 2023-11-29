//
//  ForecastViewModel.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 19/11/2023.
//

import Foundation

struct ForecastViewModel {
    
    // MARK: - Properties
    
    private let forecast: [WeatherData.DayConditions]
    
    var forecastCellViewModels: [ForecastCellViewModel] {
        forecast.map { day in
            ForecastCellViewModel(dayConditions: day)
        }
    }
    
    // MARK: - Initialization
    
    init(forecast: [WeatherData.DayConditions]) {
        self.forecast = forecast
    }
}
