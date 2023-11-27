//
//  AddLocationCell.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 21/11/2023.
//

import SwiftUI

struct AddLocationCell: View {
    // MARK: - Properties
    
    let viewModel: AddLocationCellViewModel
    let didTapPlusButton: () -> Void
    
    // MARK: - View
    
    var body: some View {
        HStack {
            Button(action: didTapPlusButton) {
                Image(systemName: "plus")
                    .padding()
                    .tint(.green)
                    .frame(width: 5.0, height: 5.0)
            }
            .padding(.all, 10.0)
            .background(.white)
            
            Spacer().frame(width: 20.0)
            
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
            
            Spacer()
        }
    }
}

#Preview {
    AddLocationCell(
        viewModel: .init(location: .preview),
        didTapPlusButton: {}
    )
}
