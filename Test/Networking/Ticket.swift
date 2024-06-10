//
//  Ticket.swift
//  Test
//
//  Created by Zhansen Zhalel on 09.06.2024.
//

import Foundation

struct Ticket: Codable {
    let id: Int
    let badge: String?
    let price: Price
    let providerName: String
    let company: String
    let departure: Flight
    let arrival: Flight
    let hasTransfer: Bool
    let hasVisaTransfer: Bool
    let luggage: Luggage
    let handLuggage: HandLuggage
    let isReturnable: Bool
    let isExchangable: Bool
    
    struct Flight: Codable {
        let town: String
        let date: Date
        let airport: String
    }
    
    struct Luggage: Codable {
        let hasLuggage: Bool
        let price: Price?
    }
    
    struct HandLuggage: Codable {
        let hasHandLuggage: Bool
        let size: String?
    }
}

struct Tickets: Codable {
    let tickets: [Ticket]
}
