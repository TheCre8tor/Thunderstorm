//
//  GeocodingClient.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 26/11/2023.
//

import CoreLocation

final class GeocodingClient: GeocodingService {
    // MARK: - Types
    
    enum GeocodingError: Error {
        case invalidAddressString
        case requestFailed
    }
    
    // MARK: - Properties
    
    private let geocoder: Geocoder
    
    // MARK: - Initialization
    
    init(geocoder: Geocoder = CLGeocoder()) {
        self.geocoder = geocoder
    } 
    
    // MARK: - Geocoding Service
    
    func geocodeAddressString(_ addressString: String) async throws -> [Location] {
        guard !addressString.isEmpty else {
            throw GeocodingError.invalidAddressString
        }
        
        do {
            let geocode = try await geocoder.geocodeAddressString(addressString)
            
            return geocode.compactMap { placemark in
                Location(placemark: placemark)
            }
        } catch {
            print("Unable to Geocode \(addressString) \(error)")
            throw GeocodingError.requestFailed
        }
    }
}
