//
//  UserDefaults+Helpers.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 27/11/2023.
//

import Foundation

extension UserDefaults {
    private enum Keys {
        static let locations = "locations"
    }
    
     @objc var locations: Data? {
        get {
            data(forKey: Keys.locations)
        }
        set {
            set(newValue, forKey: Keys.locations)
        }
    }
    
    func addLocation(_ location: Location) throws {
        var locations = try decode(
            [Location].self,
            forkey: Keys.locations
        ) ?? []
        
        locations.append(location)
        
        try encode(locations, forKey: Keys.locations)
    }
    
    func removeLocation(_ location: Location) throws {
        var locations = try decode(
            [Location].self,
            forkey: Keys.locations
        ) ?? []
        
        locations.removeAll(where: { value in
            value.id == location.id
        })
        
        try encode(locations, forKey: Keys.locations)
    }
}

fileprivate extension UserDefaults {
    func decode<T: Decodable>(_ type: T.Type, forkey key: String) throws -> T? {
        guard let data = data(forKey: key) else {
            return nil
        }
        
        return try? JSONDecoder().decode(type, from: data)
    }
    
    func encode<T: Encodable>(_ value: T, forKey key: String) throws {
        let data = try JSONEncoder().encode(value)
        set(data, forKey: key)
    }
}
