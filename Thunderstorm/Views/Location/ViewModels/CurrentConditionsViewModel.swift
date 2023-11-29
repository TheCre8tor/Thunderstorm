//
//  CurrentConditionsViewModel.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 19/11/2023.
//

import Foundation

struct CurrentConditionsViewModel {
    // MARK: - Properties
    
    private let location: Location
    private let store: Store
    private let currently: WeatherData.CurrentConditions
    private let measurementFormatter = ClearSkyFormatter()
    
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
    
    init(
        location: Location,
        store: Store,
        currently: WeatherData.CurrentConditions
    ) {
        self.location = location
        self.store = store
        self.currently = currently
    }
    
    // MARK: - Public API
    
    func delete() {
        do {
            try store.removeLocation(location)
        } catch {
            let message = String(describing: error)
            print(message)
        }
    }
 
}
