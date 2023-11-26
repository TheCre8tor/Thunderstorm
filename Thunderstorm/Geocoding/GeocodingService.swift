//
//  GeocodingService.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 26/11/2023.
//

import Foundation

protocol GeocodingService {
    func geocodeAddressString(_ addressString: String) async throws -> [Location]
}
