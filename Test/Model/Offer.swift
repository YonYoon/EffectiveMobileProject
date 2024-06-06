//
//  Offer.swift
//  Test
//
//  Created by Zhansen Zhalel on 06.06.2024.
//

import SwiftUI

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
    var image: Image {
        if id == 1 { return Image("image1")}
        else if id == 2 { return Image("image2")}
        else if id == 3 { return Image("image3")}
        else { return Image(systemName: "globe")}
    }
}
