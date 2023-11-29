//
//  WeatherPreviewClient.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 29/11/2023.
//

import Foundation

struct WeatherPreviewClient: WeatherService {
    
    func weather(for location: Location) async throws -> WeatherData {
        .preview
    }
    
}
