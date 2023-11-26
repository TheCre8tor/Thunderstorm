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
    
    var showsAddLocationView: Binding<Bool>
    
    // MARK: - View
    
    var body: some View {
        VStack {
            TextField(
                viewModel.textFieldPlaceholder,
                text: $viewModel.query
            ).padding()
        
            List {
                ForEach(viewModel.addLocationCellViewModels) { cellViewModel in
                    AddLocationCell(
                        viewModel: cellViewModel,
                        didTapPlusButton: {
                            viewModel.addLocation(
                                with: cellViewModel.id
                            )
                            showsAddLocationView.wrappedValue.toggle()
                        }
                    )
                }
            
            }
        }
        
    }
}

//#Preview {
//    let viewModel = AddLocationViewModel(
//        geocodingService: GeocodingPreviewClient()
//    )
//    
//    return AddLocationView(
//        viewModel: viewModel,
//        showsAddLocationView: Binding.constant(true)
//    )
//}
