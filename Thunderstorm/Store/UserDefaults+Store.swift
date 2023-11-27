//
//  UserDefaults+Store.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 27/11/2023.
//

import Combine
import Foundation

extension UserDefaults: Store {
    var locationsPublisher: AnyPublisher<[Location], Never> {
        publisher(for: \.locations)
            .compactMap { $0 }
            .decode(type: [Location].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .eraseToAnyPublisher()
    }
}
