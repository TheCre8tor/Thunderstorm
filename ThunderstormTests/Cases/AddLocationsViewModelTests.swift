//
//  AddLocationsViewModelTests.swift
//  ThunderstormTests
//
//  Created by Alexander Nitiola on 30/11/2023.
//

import XCTest
@testable import Thunderstorm

final class AddLocationsViewModelTests: XCTestCase {
    
    func testTextFieldPlaceholder() async throws {
        let viewModel = await AddLocationViewModel(
            store: MockStore(),
            geocodingService: MockGeocodingClient(
                result: .success(Location.mocks)
            )
        )
        
        let textFiledPlaceholder = await viewModel.textFieldPlaceholder
        XCTAssertEqual(textFiledPlaceholder, "Enter the name of a city ...")
    }

}
