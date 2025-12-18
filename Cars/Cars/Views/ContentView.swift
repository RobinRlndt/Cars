//
//  ContentView.swift
//  Cars
//
//  Created by Robin Roelandt on 16/12/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab {
                HomeView()
            } label: {
                Text("Home")
            }
            Tab {
                FavoritesView()
            } label: {
                Text("Favorieten")
            }
            Tab {
                SettingsView()
            } label: {
                Text("Instellingen")
            }

        }
        .padding()
    }
}


