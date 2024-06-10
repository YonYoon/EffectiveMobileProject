//
//  UserTicket.swift
//  Test
//
//  Created by Zhansen Zhalel on 08.06.2024.
//

import SwiftUI

class UserTicket: ObservableObject {
    @AppStorage("origin") var origin = ""
    @Published var destination = ""
    
    @Published var departureDate = Date.now
    @Published var returnDate = Date.now
}
