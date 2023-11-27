//
//  Location.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 19/11/2023.
//

import CoreLocation

struct Location: Codable, Equatable {
    // MARK: - Properties
    
    let id: String
    let name: String
    let country: String
    let latitude: Double
    let longitude: Double
    
    
    static var preview: Location {
        previews[0]
    }
    
    static var previews: [Location] {
        [
            .init(
                id: "1",
                name: "Paris",
                country: "France",
                latitude: 48.857438,
                longitude: 2.295790
            ),
            Location(
                id: "",
                name: "New York",
                country: "United States",
                latitude: 40.690337,
                longitude: -74.045473
            ),
            Location(
                id: "3",
                name: "Cape Town",
                country: "South Africa",
                latitude: -33.957369,
                longitude: 18.403098
            )
        ]
    }
    
    // MARK: - Initialization
    
    init(id: String, name: String, country: String, latitude: Double, longitude: Double) {
        self.id = id
        self.name = name
        self.country = country
        self.latitude = latitude
        self.longitude = longitude
    }
    
    init?(placemark location: CLPlacemark) {
        guard
            let name = location.name,
            let country = location.country,
            let coordinate = location.location?.coordinate
        else {
            return nil
        }
        
        id = UUID().uuidString
        self.name = name
        self.country = country
        latitude = coordinate.latitude
        longitude = coordinate.longitude
    }
    
    // MARK: - Methods
    
    static func previewsData() -> Data {
        try! JSONEncoder().encode(Location.previews)
    }
}

//extension Location {
//    static func previews() -> [Location] {
//        [
//            .init(
//                id: "1",
//                name: "Paris",
//                country: "France",
//                latitude: 48.857438,
//                longitude: 2.295790
//            ),
//            Location(
//                id: "",
//                name: "New York",
//                country: "United States",
//                latitude: 40.690337,
//                longitude: -74.045473
//            ),
//            Location(
//                id: "3",
//                name: "Cape Town",
//                country: "South Africa",
//                latitude: -33.957369,
//                longitude: 18.403098
//            )
//        ]
//    }
//
//}
