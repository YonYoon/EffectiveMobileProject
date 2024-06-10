//
//  Coordinator.swift
//  Test
//
//  Created by Zhansen Zhalel on 10.06.2024.
//

import SwiftUI

class Coordinator: ObservableObject {
    enum Views {
        case aviaFlights, allTickets
    }
    
    @Published var isAviaFlightsPresented = false
    @Published var isAllTicketsPresented = false
    
    func toggle(_ view: Views) {
        switch view {
        case .aviaFlights:
            isAviaFlightsPresented.toggle()
        case .allTickets:
            isAllTicketsPresented.toggle()
        }
    }
}
