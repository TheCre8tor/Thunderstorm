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
    
    @Published private(set) var locations: [Location] = Location.previews
    
    var textFieldPlaceholder: String = "Enter the name of a city ..."
    
    var addLocationCellViewModels: [AddLocationCellViewModel] {
        locations.map { AddLocationCellViewModel(location: $0) }
    }
    
    func addLocation(with id: String) -> Void {
        guard let locations = locations.first(where: { $0.id == id}) else {
            return
        }
        
        // Add Location
    }
}
