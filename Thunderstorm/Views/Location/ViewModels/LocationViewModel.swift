//
//  LocationViewModel.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 19/11/2023.
//

import Foundation

@MainActor
final class LocationViewModel: ObservableObject {
    
    enum State {
        case fetching
        case data(
            currentConditionsViewModel: CurrentConditionsViewModel,
            forecastViewModel: ForecastViewModel
        )
        case error(message: String)
    }
    
    // MARK: - Properties
    
    private let location: Location
    
    private let weatherService: WeatherService
    
    @Published private(set) var state: State = .fetching
    
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
            
            state = .data(
                currentConditionsViewModel: .init(currently: data.currently),
                forecastViewModel: .init(forecast: data.forecast)
            )
        
        } catch {
            let message = String(describing: error)
            print(message)
            state = .error(message: message)
        }
    }
}
