//
//  AllTicketsView.swift
//  Test
//
//  Created by Zhansen Zhalel on 09.06.2024.
//

import SwiftUI

struct AllTicketsView: View {
    @StateObject private var ticketsFetcher = TicketsFetcher()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack {
                    InfoForSearchView()
                        .padding(.bottom, 34)
                    
                    VStack(spacing: 16) {
                        ForEach(ticketsFetcher.tickets, id: \.id) { ticket in
                            TicketCardView(ticket: ticket)
                                .badged(with: ticket.badge ?? "")
                        }
                    }
                }
                .padding()
                .padding(.bottom, 50)
                .task {
                    do {
                        try await ticketsFetcher.fetchTickets()
                    } catch {
                        print(error)
                    }
                }
            }
            
            HStack(spacing: 16) {
                Button("Фильтр", systemImage: "slider.horizontal.3") { }
                
                Button("График цен", systemImage: "chart.bar.xaxis") { }
            }
            .italic()
            .font(.system(size: 14))
            .buttonStyle(PlainButtonStyle())
            .padding(10)
            .background {
                RoundedRectangle(cornerRadius: 50)
                    .foregroundStyle(.testBlue)
            }
            .padding(.bottom)
        }
    }
}

#Preview {
    AllTicketsView()
        .preferredColorScheme(.dark)
        .environmentObject(UserTicket())
}
