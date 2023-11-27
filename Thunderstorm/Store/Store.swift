//
//  Store.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 27/11/2023.
//

import Combine

protocol Store {
    var locationsPublisher: AnyPublisher<[Location], Never> { get }
    
    func addLocation(_ location: Location) throws
}
