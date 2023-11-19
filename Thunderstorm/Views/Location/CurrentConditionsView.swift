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
        Text("Current Conditions")
    }
}

#Preview {
    CurrentConditionsView(viewModel: .init())
}
