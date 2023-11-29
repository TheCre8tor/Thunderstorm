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
    
    @Published private var weatherData: WeatherData?
    
    var locationViewModel: LocationViewModel {
        LocationViewModel(location: location)
    }
    
    // MARK: - Self Executing Closure
    
    private let measurementFormatter: MeasurementFormatter = {
        let numberFormmater = NumberFormatter()
        numberFormmater.usesSignificantDigits = false
        
        let measurementFormatter = MeasurementFormatter()
        measurementFormatter.numberFormatter = numberFormmater
        
        return measurementFormatter
    }()
    
    // MARK: - Initialization
    
    init(location: Location, service: WeatherService) {
        self.location = location
        self.service = service
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
        
        let measurement = Measurement(
            value: Double(windSpeed),
            unit: UnitSpeed.milesPerHour
        )
        
        return measurementFormatter.string(from: measurement)
    }
    
    var temperature: Optional<String> {
        guard let temperature = weatherData?.currently.temperature else {
            return nil
        }
        
        let measurement = Measurement(
            value: Double(temperature),
            unit: UnitTemperature.fahrenheit
        )
        
        return measurementFormatter.string(from: measurement)
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
