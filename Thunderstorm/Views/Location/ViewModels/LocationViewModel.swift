//
//  LocationViewModel.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 19/11/2023.
//

import Foundation

@MainActor
final class LocationViewModel: ObservableObject {
    
    // MARK: - Properties
    
    private let location: Location
    
    private let weatherService: WeatherService
    
    @Published private(set) var currentConditionsViewModel: CurrentConditionsViewModel?
    
    @Published private(set) var forecastViewModel: ForecastViewModel?
    
    var locationName: String {
        location.name
    }
    
    // MARK: - Initialization
    
    init(location: Location, weatherService: WeatherService) {
        self.location = location
        self.weatherService = weatherService
    }
    
    //  MARK: - Public API
    
    func start() async {
        do {
            let data = try await weatherService.weather(for: location)
            
            currentConditionsViewModel = .init(currently: data.currently)
            forecastViewModel = .init(forecast: data.forecast)
        } catch {
            let message = String(describing: error)
            print(message)
        }
    }
}
