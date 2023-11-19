//
//  LocationView.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 19/11/2023.
//

import SwiftUI

struct LocationView: View {
    // MARK: - Properties
    
    let viewModel: LocationViewModel
    
    // MARK: - View
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0, content: {
            CurrentConditionsView(
                viewModel: viewModel.currentConditionsViewModel
            )
            Divider()
            ForecastView(
                viewModel: viewModel.forecastViewModel
            )
        })
    }
}

#Preview {
    LocationView(viewModel: .init(location: .preview))
}
