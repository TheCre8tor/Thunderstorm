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
    
    // MARK: - View
    
    var body: some View {
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
    }
}

//#Preview {
//    CurrentConditionsView(viewModel: .init())
//}
