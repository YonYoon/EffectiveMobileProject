//
//  TicketOfferCollectionFetcher.swift
//  Test
//
//  Created by Zhansen Zhalel on 08.06.2024.
//

import Foundation

class TicketOfferCollectionFetcher: ObservableObject {
    @Published var offers = [TicketOffer]()
    
    private let urlString = "https://run.mocky.io/v3/7e55bf02-89ff-4847-9eb7-7d83ef884017"
    
    func fetchOffers() async throws {
        guard let url = URL(string: urlString) else { throw FetchError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw FetchError.invalidResponse }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        
        Task { @MainActor in
            do {
                offers = try decoder.decode(TicketOfferCollection.self, from: data).ticketsOffers
            } catch {
                throw FetchError.invalidData
            }
        }
    }
}
