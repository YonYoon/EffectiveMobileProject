//
//  TicketOffer.swift
//  Test
//
//  Created by Zhansen Zhalel on 08.06.2024.
//

import SwiftUI

struct TicketOffer: Codable, Identifiable {
    let id: Int
    let title: String
    let timeRange: [String]
    let price: Price
}

struct TicketOfferCollection: Codable {
    let ticketsOffers: [TicketOffer]
}

extension TicketOffer {
    var color: Color {
        if id == 1 {
            return .testRed
        } else if id == 10 {
            return .testBlue
        } else {
            return .white
        }
    }
    
    var timeRangeString: String {
        var times = ""
        
        for timeRange in self.timeRange {
            times += timeRange + " "
        }
        
        return times
    }
}
