//
//  HomeView.swift
//  Cars
//
//  Created by Robin Roelandt on 16/12/2025.
//

import SwiftUI

struct HomeView: View {
    @Environment(DataManager.self) var carsDataStore
    @Environment(PathStore.self) var pathStore
    @State var loading = true
    
    var body: some View {
        @Bindable var pathBinding = pathStore
        
        NavigationStack(path: $pathBinding.path) {
            if loading {
                ProgressView("loading...")
            } else {
                List(carsDataStore.cars, id: \.self) { car in
                    NavigationLink(value: Destination.car(car)) {
                        VStack(alignment: .leading) {
                            Text("\(car.model)")
                                .font(.title)
                                .foregroundColor(.accentColor)
                            Text("\(car.brand)")
                                .font(.title2)
                                .fontWeight(.bold)
                            Divider()
                        }
                        .navigationDestination(for: Destination.self) { destination in
                            PathView(destination: destination)}
                    }
                }
                
            }
                .task {
                await carsDataStore.loadCars()
                loading = false
            }
        }
    }
}
