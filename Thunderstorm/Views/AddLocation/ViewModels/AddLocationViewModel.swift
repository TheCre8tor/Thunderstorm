//
//  AddLocationViewModel.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 21/11/2023.
//

import Foundation

internal final class AddLocationViewModel: ObservableObject {
    // MARK: - Properties
    
    @Published var query = ""
    
    var textFieldPlaceholder: String = "Enter the name of a city ..."
}
