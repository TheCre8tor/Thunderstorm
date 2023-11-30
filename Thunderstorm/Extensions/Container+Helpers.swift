//
//  Container+Helpers.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 30/11/2023.
//

import Swinject
import Foundation

extension Container {
    
    static let shared = Container()
    
    static var store: Store {
        shared.resolve(Store.self)!
    }
}
