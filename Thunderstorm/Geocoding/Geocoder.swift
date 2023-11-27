//
//  Geocoder.swift
//  Thunderstorm
// 
//  Created by Alexander Nitiola on 27/11/2023.
//

import CoreLocation

protocol Geocoder {
    func geocodeAddressString(_ addressString: String) async throws -> [CLPlacemark]
}
