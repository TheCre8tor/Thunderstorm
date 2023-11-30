//
//  AddLocationCellViewModelTest.swift
//  ThunderstormTests
//
//  Created by Alexander Nitiola on 30/11/2023.
//

import XCTest
@testable import Thunderstorm

final class AddLocationCellViewModelTest: XCTestCase {
    
    func testIdentifiableConformance() throws {
        let location: Location = .mock
        let viewModel = AddLocationCellViewModel(location: location)
        
        XCTAssertEqual(viewModel.id, location.id)
    }
    
    func testComputedProperties() throws {
        let location: Location = .mock
        let viewModel = AddLocationCellViewModel(location: location)
        
        XCTAssertEqual(viewModel.name, location.name)
        XCTAssertEqual(viewModel.country, location.country)
        XCTAssertEqual(viewModel.coordinates,  "\(location.latitude), \(location.longitude)")
    }
}
