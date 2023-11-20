//
//  ForecastViewModel.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 19/11/2023.
//

import Foundation

struct ForecastViewModel {
    // MARK: - Properties
    
    var forecastCellViewModels: [ForecastCellViewModel] {
        (0..<10).map { day in
            let increment = 24 * 3600 * TimeInterval(day)
            let forecastDate = Date().addingTimeInterval(increment)
            return ForecastCellViewModel(forecastDate: forecastDate)
        }
    }
}
