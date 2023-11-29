//
//  PreviewStore.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 27/11/2023.
//

import Combine

final class PreviewStore: Store {
    
    @Published private var locations = Location.previews
    
    var locationsPublisher: AnyPublisher<[Location], Never> {
        $locations.eraseToAnyPublisher()
    }
    
    func addLocation(_ location: Location) throws {
        locations.append(location)
    }
    
    func removeLocation(_ location: Location) throws {
        locations.removeAll(where: { $0.id == location.id })
    }
}
