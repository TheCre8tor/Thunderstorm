//
//  LocationView.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 19/11/2023.
//

import SwiftUI

struct LocationView: View {
    // MARK: - Properties
    
    @ObservedObject var viewModel: LocationViewModel
    
    // MARK: - View
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0, content: {
            
            switch viewModel.state {
            case .fetching:
                ProgressView()
            case let .data(
                currentConditionsViewModel: currentConditionsViewModel,
                forecastViewModel: forecastViewModel 
            ):
                CurrentConditionsView(
                    viewModel: currentConditionsViewModel
                )
                Divider()
                ForecastView(
                    viewModel: forecastViewModel 
                )
            case .error(message: let message):
                Text(message.description)
                    .padding()
                    .foregroundColor(.accentColor)
                    .multilineTextAlignment(.center)
            }
            
        })
        .navigationTitle(viewModel.locationName)
        .task {
            await viewModel.start()
        }
    }
}

#Preview {
    NavigationView {
        LocationView(
            viewModel: .init(
                location: .preview,
                weatherService: WeatherPreviewClient(result: .failure(.init()))
            )
        )
    }

}
