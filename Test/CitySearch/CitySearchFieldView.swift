//
//  CitySearchFieldView.swift
//  Test
//
//  Created by Zhansen Zhalel on 08.06.2024.
//

import SwiftUI

struct CitySearchFieldView: View {
    @Binding var isAviaFlightsPresented: Bool
    @EnvironmentObject var ticket: TicketViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "airplane")
                TextField("Откуда - Москва", text: $ticket.origin)
            }
            
            Divider()
                .overlay {
                    Color(.testGrey4)
                }
                .padding(.vertical, 8)
            
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Куда - Турция", text: $ticket.destination)
                    .onSubmit {
                        dismiss()
                        isAviaFlightsPresented.toggle()
                    }
                
                if !ticket.destination.isEmpty {
                    Button {
                        ticket.destination = ""
                    } label: {
                        Image(systemName: "xmark")
                            .font(.footnote)
                            .padding(.trailing, 8)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
        .padding(16)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(Color(red: 0.18, green: 0.19, blue: 0.21))
        }
        .shadow(radius: 4, y: 4)
    }
}

#Preview {
    CitySearchFieldView(isAviaFlightsPresented: .constant(false))
        .environmentObject(TicketViewModel())
        .preferredColorScheme(.dark)
}
