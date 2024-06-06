//
//  OfferCollectionFetcher.swift
//  Test
//
//  Created by Zhansen Zhalel on 05.06.2024.
//

import SwiftUI

class OfferCollectionFetcher: ObservableObject {
    @Published var offers = [Offer]()
    
    private let urlString = "https://run.mocky.io/v3/214a1713-bac0-4853-907c-a1dfc3cd05fd"
    
    enum FetchError: Error {
        case invalidResponse
        case invalidURL
        case invalidData
    }
    
    func fetchOffers() async throws {
        guard let url = URL(string: urlString) else { throw FetchError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw FetchError.invalidResponse }
        
        Task { @MainActor in
            do {
                offers = try JSONDecoder().decode(OfferCollection.self, from: data).offers
            } catch {
                throw FetchError.invalidData
            }
        }
    }
}
