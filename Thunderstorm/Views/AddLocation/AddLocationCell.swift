//
//  AddLocationCell.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 21/11/2023.
//

import SwiftUI

struct AddLocationCell: View {
    // MARK: - Properties
    
    var viewModel: AddLocationCellViewModel
    
    // MARK: - View
    
    var body: some View {
        VStack(alignment: .leading, content: {
            Text(viewModel.name)
                .font(.headline)
                .foregroundColor(.accentColor)
            Text(viewModel.country)
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(viewModel.coordinates)
                .font(.caption)
                .foregroundColor(.gray)
        })
    }
}

#Preview {
    AddLocationCell(viewModel: .init(location: .preview))
}
