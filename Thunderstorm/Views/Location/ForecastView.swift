//
//  ForcastView.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 19/11/2023.
//

import SwiftUI

struct ForecastView: View {
    // MARK: - Properties
    
    let viewModel: ForecastViewModel
    
    // MARK: - View
    
    var body: some View {
        Text("Forecast View")
    }
}

#Preview {
    ForecastView(viewModel: .init())
}
