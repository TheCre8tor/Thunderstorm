//
//  LocationsView.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 18/11/2023.
//

import SwiftUI

struct LocationsView: View {
    internal let viewModel: LocationsViewModel
    
    var body: some View {
        NavigationStack {
            Text("Hello, World!")
                .navigationTitle(viewModel.title)
        }
    }
}

#Preview {
    LocationsView(viewModel: .init())
}
