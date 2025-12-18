//
//  HomeView.swift
//  Cars
//
//  Created by Robin Roelandt on 16/12/2025.
//

import SwiftUI

struct HomeView: View {
    @Environment(DataManager.self) var carsDataStore
    @Environment(AppState.self) var appState
    @State var loading = true
    
    var body: some View {
        @Bindable var appStateBinding = appState
        
        NavigationStack(path: $appStateBinding.path) {
            if loading {
                ProgressView("loading...")
            } else {
                List(carsDataStore.cars, id: \.self) { car in
                    NavigationLink(value: Destination.car(car)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("\(car.model)")
                                    .font(.title)
                                    .foregroundColor(.accentColor)
                                Text("\(car.brand)")
                                    .font(.title2)
                                    .fontWeight(.bold)
                            }
                            
                            HStack {
                                Image(systemName: "car.fill")
                                    .frame(width: 60, height: 60)
                                
                                Button {
                                    toggleFavorite(car)
                                } label: {
                                    Image(systemName: "hand.thumbsup")
                                }
                                .foregroundColor(isFavorite(car) ? .blue : .gray)
                                .buttonStyle(.plain)
                            }
                        }
                    }
                }
                .navigationDestination(for: Destination.self) { destination in
                    PathView(destination: destination)
                }
            }
        }
        .task {
            await carsDataStore.loadCars()
            loading = false
        }
    }
    
    private func isFavorite(_ car: Car) -> Bool {
        appState.favorites.contains { $0 == car }
    }
    
    private func toggleFavorite(_ car: Car) {
        if isFavorite(car) {
            appState.removeFavorite()
        } else {
            appState.favorites.append(car)
        }
    }
}

