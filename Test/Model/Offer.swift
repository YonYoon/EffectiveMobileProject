//
//  Offer.swift
//  Test
//
//  Created by Zhansen Zhalel on 06.06.2024.
//

import Foundation

struct Offer: Codable, Identifiable {
    let id: Int
    let title: String
    let town: String
    let price: Price
    
    struct Price: Codable {
        let value: Int
    }
}

struct OfferCollection: Codable {
    let offers: [Offer]
}

extension Offer {
    var imageName: String {
        if id == 1 { return "image1"}
        else if id == 2 { return "image2"}
        else if id == 3 { return "image3"}
        else { return "image3"}
    }
}
