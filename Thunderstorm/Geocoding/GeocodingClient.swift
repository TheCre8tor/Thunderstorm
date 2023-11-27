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
    }
    
    // MARK: - Properties
    
    private let geocoder = CLGeocoder()
    
    // MARK: - Geocoding Service
    
    func geocodeAddressString(_ addressString: String) async throws -> [Location] {
        guard !addressString.isEmpty else {
            throw GeocodingError.invalidAddressString
        }
        
        do {
            let placemarks = try await geocoder.geocodeAddressString(addressString)
            placemarks.compactMap { placemark -> Location? in
                
            }
        } catch {
            
        }
    }
}
