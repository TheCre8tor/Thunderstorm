//
//  Configuration.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 29/11/2023.
//

import Foundation

enum Configuration {
    
    private enum Keys {
        static let clearSkyBaseURL = "CLEAR_SKY_BASE_URL"
        static let clearSkyAPIKey = "CLEAR_SKY_API_KEY"
    }
    
    private static var infoDictionary: [String: Any] {
        Bundle.main.infoDictionary ?? [:]
    }
    
    static var clearSkyBaseURL: URL {
        let url = infoDictionary[Keys.clearSkyBaseURL] as! String
        return URL(string: url)!
    }
    
    static var clearSkyAPIKey: String {
        infoDictionary[Keys.clearSkyAPIKey] as! String
    }
    
}
