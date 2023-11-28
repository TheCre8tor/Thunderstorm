//
//  ClearSkyDecoder.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 28/11/2023.
//

import Foundation

final class ClearSkyDecoder: JSONDecoder {
    
    override init() {
        super.init()
        
        dateDecodingStrategy = .secondsSince1970
    }
    
}
