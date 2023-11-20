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
        Text(viewModel.temperature())
    }
}

#Preview {
    ForecastCell(viewModel: .init())
}
