//
//  PathStore.swift
//  Cars
//
//  Created by Robin Roelandt on 16/12/2025.
//

import Foundation

enum Destination: Hashable {
    case car(Car)
}

@Observable
class AppState {
    var path = [Destination]()
    
    var favorites = [Car]()
    
    func append(_ car: Car) {
            favorites.append(car)
        }
        
    func removeFavorite() {
            favorites.removeLast()
        }
    
    func append(_ destination: Destination) {
            path.append(destination)
        }
        
    func removeLast() {
            path.removeLast()
        }
}
