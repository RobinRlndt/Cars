//
//  CarsApp.swift
//  Cars
//
//  Created by Robin Roelandt on 16/12/2025.
//

import SwiftUI

@main
struct CarsApp: App {
    @State private var carsDataStore = DataManager()
    @State private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(carsDataStore)
                .environment(appState)
        }
    }
}
