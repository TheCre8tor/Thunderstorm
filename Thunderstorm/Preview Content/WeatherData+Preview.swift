//
//  WeatherData+Preview.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 28/11/2023.
//

import Foundation

extension WeatherData {
    
    static var preview: Self {
        let url = Bundle.main.url(
            forResource: "clearsky",
            withExtension: "json"
        )!
        
        let data = try! Data(contentsOf: url)
        
        return try! ClearSkyDecoder().decode(
            WeatherData.self,
            from: data
        )
    }
}
