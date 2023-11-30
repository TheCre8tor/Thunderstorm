//
//  MockStore.swift
//  ThunderstormTests
//
//  Created by Alexander Nitiola on 30/11/2023.
//

import Combine
import Foundation
@testable import Thunderstorm

final class MockStore: Store {
    
    // MARK: - Properties
    
    @Published private var locations: [Location]
    
    // MARK: - initialization
    
    init(locations: [Location] = []) {
        self.locations = locations
    }
    
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


