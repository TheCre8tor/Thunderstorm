//
//  ThunderstormApp.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 18/11/2023.
//

import SwiftUI

@main
struct ThunderstormApp: App {
    var body: some Scene {
        WindowGroup {
            LocationsView(viewModel: .init(store: UserDefaults.standard))
        }
    }
}
