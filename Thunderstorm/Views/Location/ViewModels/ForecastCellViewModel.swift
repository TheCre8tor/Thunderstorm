//
//  ForecastCellViewModel.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 20/11/2023.
//

import Foundation

struct ForecastCellViewModel: Identifiable {
    // MARK: - Properties
    
    private let forecastDate: Date
    
    private let dateFormatter = DateFormatter()
    
    var id: UUID { UUID() }
    
    var day: String {
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: forecastDate).capitalized
    }
    
    var date: String {
        dateFormatter.dateFormat = "MMMM d"
        return dateFormatter.string(from: forecastDate).capitalized
    }
    
    var summary: String {
        "Clear"
    }
    
    var imageName: String {
        "sun.max"
    }
    
    var windSpeed: String {
        let windSpeed = Int.random(in: 0...30)
        return "\(windSpeed) mi/h"
    }
    
    // MARK: - Initialization
    init(forecastDate: Date) {
        self.forecastDate = forecastDate
    }
    
    func lowTemperature() -> String {
        let temperature = Int.random(in: 50...70)
        return "\(temperature) °F"
    }
    
    func highTemperature() -> String {
        let temperature = Int.random(in: 70...90)
        return "\(temperature) °F"
    }
}
