//
//  InfoForSearchView.swift
//  Test
//
//  Created by Zhansen Zhalel on 09.06.2024.
//

import SwiftUI

struct InfoForSearchView: View {
    @EnvironmentObject var ticket: UserTicket
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        HStack {
            Button {
                coordinator.toggle(.allTickets)
            } label: {
                Image(systemName: "arrow.left")
                    .fontWeight(.medium)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Title3("\(ticket.origin)-\(ticket.destination)")
                
                Title4("\(ticket.departureDate.formatted(.dateTime.day().month(.wide))), 1 пассажир")
                    .foregroundStyle(.testGrey6)
            }
            .italic()
            
            Spacer()
        }
        .padding(.vertical, 8)
        .padding(.leading, 5)
        .background {
            Rectangle()
                .foregroundStyle(.testGrey2)
        }
    }
}

#Preview {
    InfoForSearchView()
        .environmentObject(UserTicket())
        .preferredColorScheme(.dark)
}
