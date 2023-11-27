//
//  ForecastCell.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 20/11/2023.
//

import SwiftUI

struct ForecastCell: View {
    // MARK: - Properties
    
    let viewModel: ForecastCellViewModel
    
    // MARK: - View
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, content: {
                Text(viewModel.day)
                    .font(.title)
                    .foregroundColor(.accentColor)
                
                Group {
                    Text(viewModel.date)
                    Spacer()
                    Text(viewModel.summary)
                }
                .font(.body)
                .foregroundColor(.darkzGray)
                
            })
            
            Spacer()
            
            VStack(alignment: .trailing, content: {
                Image(systemName: viewModel.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40.0)
                    .foregroundColor(.darkzGray)
                
                Spacer()
                
                Text(viewModel.windSpeed)
                    .font(.body)
                    .foregroundColor(.darkzGray)
                
                HStack {
                    Text("\(viewModel.lowTemperature()) - ")
                    Text(viewModel.highTemperature())
                }
            })
        }
    }
}

#Preview {
    ForecastCell(viewModel: .init(forecastDate: Date()))
}
