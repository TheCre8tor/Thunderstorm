//
//  ThunderstormApp.swift
//  Thunderstorm
//
//  Created by Alexander Nitiola on 18/11/2023.
//

import SwiftUI
import Swinject

@main
struct ThunderstormApp: App {
    init() {
        registerServices()
    }
    
    var body: some Scene {
        WindowGroup {
            LocationsView(
                viewModel: LocationsViewModel(
                    store: Container.store,
                    weatherService: WeatherClient()
                )
            )
        }
    }
    
    private func registerServices() {
        Container.shared.register(Store.self, factory: { _ in
            UserDefaults.standard
        })
    }
}
