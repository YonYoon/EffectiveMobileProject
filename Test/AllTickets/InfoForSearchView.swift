//
//  InfoForSearchView.swift
//  Test
//
//  Created by Zhansen Zhalel on 09.06.2024.
//

import SwiftUI

struct InfoForSearchView: View {
    @EnvironmentObject var ticket: TicketViewModel
    @Binding var isPresented: Bool
    
    var body: some View {
        HStack {
            Button {
                isPresented = false
            } label: {
                Image(systemName: "arrow.left")
                    .fontWeight(.medium)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Title3("\(ticket.origin)-\(ticket.destination)")
                
                Title4("\(ticket.departureDate.formatted(.dateTime.day().month(.wide))), 1 пассажир")
                    .foregroundStyle(.testGrey6)
            }
            
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
    InfoForSearchView(isPresented: .constant(true))
        .environmentObject(TicketViewModel())
        .preferredColorScheme(.dark)
}
