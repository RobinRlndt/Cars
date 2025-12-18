//
//  FavoritesView.swift
//  Cars
//
//  Created by Robin Roelandt on 16/12/2025.
//

import SwiftUI

struct FavoritesView: View {
    @Environment(AppState.self) var appState
    
    var body: some View {
        List {
            ForEach(appState.favorites, id: \.self) { car in
                NavigationLink(value: Destination.car(car)) {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(car.model)
                                .font(.headline)
                                .foregroundColor(.accentColor)
                            Text(car.brand)
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundColor(.secondary)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack(spacing: 12) {
                            Image(systemName: "car.fill")
                                .font(.title2)
                                .foregroundColor(.secondary)
                            
                            Button {
                                appState.removeFavorite()
                            } label: {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(.red)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
        }
    }
}

