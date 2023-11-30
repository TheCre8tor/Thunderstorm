//
//  CurrentConditionsView.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 19/11/2023.
//

import SwiftUI

struct CurrentConditionsView: View {
    // MARK: - Properties
    
    let viewModel: CurrentConditionsViewModel
    
    @Environment(\.dismiss) var dismiss
    
    // MARK: - View
    
    var body: some View {
        HStack {
            VStack(alignment: .leading ,content: {
                Text(viewModel.temperature).font(.largeTitle)
                
                Group {
                    HStack {
                        Image(systemName: "wind")
                            .foregroundColor(.gray)
                        Text(viewModel.windSpeed)
                    }
                    Spacer().frame(height: 10.0)
                    Text(viewModel.summary)
                }.font(.body)
                
            }).padding()
            
            Spacer()
            
            Button(
                action: {
                    viewModel.delete()
                    dismiss()
                },
                label: {
                    Image(systemName: "trash")
                        .foregroundColor(.accentColor)
                }
            )
            Spacer().frame(width: 24)
        }
    }
}

#Preview {
    CurrentConditionsView(
        viewModel: .init(
            location: Location.preview,
            store: PreviewStore(),
            currently: WeatherData.preview.currently
        )
    )
}
