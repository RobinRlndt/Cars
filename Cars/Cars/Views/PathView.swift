//
//  PathView.swift
//  Cars
//
//  Created by Robin Roelandt on 16/12/2025.
//

import SwiftUI

struct PathView: View {
    let destination: Destination
    
    var body: some View {
        Group {
            switch destination {
            case let .car(car):
                CarDetailView(car: car)
            }
        }
    }
}


