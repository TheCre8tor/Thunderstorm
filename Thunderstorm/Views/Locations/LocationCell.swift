//
//  LocationCell.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 19/11/2023.
//

import SwiftUI

struct LocationCell: View {
    // MARK: - Properties
    
    @ObservedObject var viewModel: LocationCellViewModel
    
    // MARK: - View
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(viewModel.locationName)
                    .font(.title)
                    .foregroundColor(.accentColor)
                Text(viewModel.locationCountry)
                    .font(.body)
                    .foregroundColor(.gray)
                Spacer()
                if let summary = viewModel.summary {
                    Text(summary).multilineTextAlignment(.leading)
                }
            }
            Spacer()
            if
                let temperature = viewModel.temperature,
                let windSpeed = viewModel.windSpeed
            {
                VStack(alignment: .trailing) {
                    HStack {
                        Image(systemName: "thermometer")
                            .foregroundColor(.gray)
                        Text(temperature)
                    }
                    HStack {
                        Image(systemName: "wind")
                            .foregroundColor(.gray)
                        Text(windSpeed)
                    }
                    Spacer()
                }
            } else {
                ProgressView()
            }
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 10.0)
                .stroke(Color.gray)
                .opacity(0.25)
        }
        .task {
            await viewModel.start()
        }
    }
}

#Preview {
    let viewModel = LocationCellViewModel(
        location: .preview,
        service: WeatherPreviewClient()
    )
    
    return LocationCell(viewModel: viewModel)
}
