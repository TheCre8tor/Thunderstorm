//
//  ForecastCellViewModel.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 20/11/2023.
//

import Foundation

struct ForecastCellViewModel: Identifiable {
    // MARK: - Properties
    
    var id: UUID { UUID() }
    
    func temperature() -> String {
        let temperature = Int.random(in: 50...80)
        return "\(temperature) °F"
    }
}
