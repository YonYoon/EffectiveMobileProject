//
//  AllTicketsView.swift
//  Test
//
//  Created by Zhansen Zhalel on 09.06.2024.
//

import SwiftUI

struct AllTicketsView: View {
    @StateObject private var ticketsFetcher = TicketsFetcher()
    
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack {
                    InfoForSearchView(isPresented: $isPresented)
                        .padding(.bottom, 34)
                    
                    VStack(spacing: 16) {
                        ForEach(ticketsFetcher.tickets, id: \.id) { ticket in
                            TicketCardView(ticket: ticket)
                                .badged(with: ticket.badge ?? "")
                        }
                    }
                }
                .task {
                    do {
                        try await ticketsFetcher.fetchTickets()
                    } catch {
                        print(error)
                    }
                }
            }
            .padding(.horizontal)
            
            HStack(spacing: 16) {
                Button("Фильтр", systemImage: "slider.horizontal.3") { }
                
                Button("График цен", systemImage: "chart.bar.xaxis") { }
            }
            .padding(10)
            .buttonStyle(PlainButtonStyle())
            .background {
                RoundedRectangle(cornerRadius: 50)
                    .foregroundStyle(.testBlue)
            }
        }
    }
}

#Preview {
    AllTicketsView(isPresented: .constant(true))
        .preferredColorScheme(.dark)
        .environmentObject(TicketViewModel())
}
