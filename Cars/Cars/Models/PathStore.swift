//
//  PathStore.swift
//  Cars
//
//  Created by Robin Roelandt on 16/12/2025.
//

import Foundation

enum Destination: Hashable {
    
}

@Observable
class PathStore {
    var path = [Destination]()
    
    func append(_ destination: Destination) {
            path.append(destination)
        }
        
        func removeLast() {
            path.removeLast()
        }
}
