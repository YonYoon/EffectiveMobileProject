//
//  TicketsFetcher.swift
//  Test
//
//  Created by Zhansen Zhalel on 09.06.2024.
//

import Foundation

class TicketsFetcher: ObservableObject {
    @Published var tickets = [Ticket]()
    
    private let urlString = "https://run.mocky.io/v3/670c3d56-7f03-4237-9e34-d437a9e56ebf"
    
    @MainActor
    func fetchTickets() async throws {
        do {
            guard let url = URL(string: urlString) else { throw FetchError.invalidURL }
            
            let (data, response) = try await URLSession.shared.data(from: url)

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw FetchError.invalidResponse }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            
            self.tickets = try decoder.decode(Tickets.self, from: data).tickets
        } catch {
            print(error)
        }
    }
}
