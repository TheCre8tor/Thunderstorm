//
//  LocationsView.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 18/11/2023.
//

import SwiftUI

struct LocationsView: View {
    // MARK: - Properties
    
    internal let viewModel: LocationsViewModel
    
    // MARK: - View
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(
                    columns: [GridItem()],
                    spacing: 20.0,
                    pinnedViews: /*@START_MENU_TOKEN@*/[]/*@END_MENU_TOKEN@*/
                ) {
                    ForEach(viewModel.locationCellViewModels) { viewModel in
                        NavigationLink(
                            destination: LocationView(
                                viewModel: viewModel.locationViewModel
                            ),
                            label: {
                                LocationCell(viewModel: viewModel)
                            }
                        )
                    }
                }.padding()
            }.navigationTitle(viewModel.title)
        }
    }
}

#Preview {
    LocationsView(viewModel: .init())
}
