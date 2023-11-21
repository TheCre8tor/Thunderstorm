//
//  AddLocationView.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 21/11/2023.
//

import SwiftUI

struct AddLocationView: View {
    // MARK: - Properties
    
    @ObservedObject var viewModel: AddLocationViewModel
    
    // MARK: - View
    
    var body: some View {
        VStack {
            TextField(
                viewModel.textFieldPlaceholder, 
                text: $viewModel.query
            ).padding()
        }
    }
}

#Preview {
    AddLocationView(viewModel: .init())
}
