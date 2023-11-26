//
//  GeocodingPreviewClient.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 26/11/2023.
//

import Foundation

struct GeocodingPreviewClient: GeocodingService {
    func geocodeAddressString(_ addressString: String) async throws -> [Location] {
        Location.previews
    }
}
