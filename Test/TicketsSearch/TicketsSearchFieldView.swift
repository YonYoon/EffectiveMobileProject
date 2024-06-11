//
//  TicketsSearchFieldView.swift
//  Test
//
//  Created by Zhansen Zhalel on 08.06.2024.
//

import SwiftUI

struct TicketsSearchFieldView: View {
    @EnvironmentObject var userTicket: UserTicket
    @State private var isCitySearchPresented = false
    
    var body: some View {
        Group {
            HStack(spacing: 16) {
                Image(systemName: "magnifyingglass")
                
                VStack {
                    TextField("Откуда - Москва", text: $userTicket.origin)
                    
                    Divider()
                        .overlay {
                            Color(.testGrey6)
                        }
                    
                    HStack {
                        Button("Куда - Турция") {
                            isCitySearchPresented.toggle()
                        }
                        .foregroundStyle(.tertiary)
                        .sheet(isPresented: $isCitySearchPresented) {
                            CitySearchView()
                                .presentationBackground(Color(red: 36/255, green: 37/255, blue: 41/255))
                        }
    
                        Spacer()
                    }
                }
            }
            .padding([.vertical, .trailing], 16)
            .padding(.leading, 8)
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(Color(.testGrey4))
            }
            .shadow(radius: 4, y: 4)
        }
        .padding(16)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(Color(red: 0.18, green: 0.19, blue: 0.21))
        }
    }
}

#Preview {
    TicketsSearchFieldView()
        .preferredColorScheme(.dark)
        .environmentObject(UserTicket())
}
