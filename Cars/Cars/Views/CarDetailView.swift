//
//  CarDetailView.swift
//  Cars
//
//  Created by Robin Roelandt on 16/12/2025.
//

import SwiftUI

struct CarDetailView: View {
    @Environment(AppState.self) var appState
    let car: Car
    
    private var isFavorite: Bool {
        appState.favorites.contains { $0 == car }
    }
    
    var body: some View {
        ScrollView {
            HStack {
                VStack(alignment: .leading) {
                    Text("\(car.model)")
                        .font(.title)
                        .foregroundColor(.accentColor)
                    Text("\(car.brand)")
                        .fontWeight(.bold)
                    Text("\(Int(car.year))")  // Fix decimal
                        .fontWeight(.bold)
                    Text("\(car.fuelType)")
                        .font(.title2)
                        .fontWeight(.bold)
                    Divider()
                    Text("\(car.price)")
                        .foregroundColor(.accentColor)
                    Divider()
                    Text("\(car.color)")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity)
                
                Image(systemName: "car.fill")
                    .frame(width: 100, height: 100)
            }
            .frame(maxWidth: .infinity)
            
            Button {
                toggleFavorite()
            } label: {
                Image(systemName: "hand.thumbsup")
                    .font(.title2)
            }
            .foregroundColor(isFavorite ? .blue : .gray)
            .buttonStyle(.plain)
        }
    }
    
    private func toggleFavorite() {
        if isFavorite {
            appState.removeFavorite()
        } else {
            appState.favorites.append(car)
        }
    }
}

    

