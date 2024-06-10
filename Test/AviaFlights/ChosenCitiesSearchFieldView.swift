//
//  ChosenCitiesSearchFieldView.swift
//  Test
//
//  Created by Zhansen Zhalel on 08.06.2024.
//

import SwiftUI

struct ChosenCitiesSearchFieldView: View {
    @EnvironmentObject var userTicket: UserTicket
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        HStack {
            Button {
                coordinator.toggle(.aviaFlights)
            } label: {
                Image(systemName: "arrow.left")
                    .fontWeight(.medium)
            }
            .buttonStyle(PlainButtonStyle())
            
            VStack {
                HStack {
                    TextField("Откуда - Москва", text: $userTicket.origin)
                    
                    Button {
                        replace(&userTicket.origin, and: &userTicket.destination)
                    } label: {
                        Image(systemName: "arrow.up.arrow.down")
                            .font(.footnote)
                            .padding(.trailing, 5)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
                Divider()
                    .overlay {
                        Color(.testGrey4)
                    }
                    .padding(.vertical, 8)
                
                HStack {
                    TextField("Куда - Турция", text: $userTicket.destination)
                    
                    if !userTicket.destination.isEmpty {
                        Button {
                            userTicket.destination = ""
                        } label: {
                            Image(systemName: "xmark")
                                .font(.footnote)
                                .padding(.trailing, 8)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(Color(red: 0.18, green: 0.19, blue: 0.21))
        }
    }
    
    func replace(_ x: inout String, and y: inout String) {
        let temp = x
        x = y
        y = temp
    }
}

#Preview {
    ChosenCitiesSearchFieldView()
        .environmentObject(UserTicket())
        .environmentObject(Coordinator())
        .preferredColorScheme(.dark)
}
