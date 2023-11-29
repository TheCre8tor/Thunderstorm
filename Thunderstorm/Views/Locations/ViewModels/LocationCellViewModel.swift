//
//  LocationCellViewModel.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 19/11/2023.
//

import Foundation

// This serves as an `entity` in DDD
@MainActor
final class LocationCellViewModel: Identifiable, ObservableObject {
    // MARK: - Properties
    
    private let location: Location
    
    private let service: WeatherService
    
    private let formatter: ClearSkyFormatter
    
    @Published private var weatherData: WeatherData?
    
    var locationViewModel: LocationViewModel {
        LocationViewModel(
            location: location,
            weatherService: service
        )
    }
    
    // MARK: - Initialization
    
    init(
        location: Location,
        service: WeatherService,
        formater: ClearSkyFormatter = ClearSkyFormatter()
    ) {
        self.location = location
        self.service = service
        self.formatter = formater
    }
    
    // MARK: - Public API
    
    var locationName: String { location.name }
    
    var locationCountry: String { location.country }
    
    var summary: Optional<String> {
        weatherData?.currently.summary
    }
    
    var windSpeed: Optional<String> {
        guard let windSpeed = weatherData?.currently.windSpeed else {
            return Optional.none
        }
        
        return formatter.formatWindSpeed(windSpeed)
    }
    
    var temperature: Optional<String> {
        guard let temperature = weatherData?.currently.temperature else {
            return nil
        }
        
        return formatter.formatTemperature(temperature)
    }
    
    func start() async {
        do {
            weatherData = try await service.weather(for: location)
        } catch {
            let message = String(describing: error)
            print(message)
        }
    }
}
