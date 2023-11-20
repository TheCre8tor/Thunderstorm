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
        (0..<10).map{ _ in ForecastCellViewModel() }
    }
}
