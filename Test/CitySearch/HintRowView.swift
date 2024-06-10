//
//  HintRowView.swift
//  Test
//
//  Created by Zhansen Zhalel on 08.06.2024.
//

import SwiftUI

struct HintRowView: View {
    @EnvironmentObject var ticket: UserTicket
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            NavigationLink {
                Text("Сложный маршрут")
            } label: {
                HintView(color: .testDarkGreen, imageName: "command", text: "Сложный маршрут", width: 70)
            }
            .foregroundStyle(.primary)
            
            Button {
                ticket.destination = "Куда угодно"
            } label: {
                HintView(color: .testBlue, imageName: "globe", text: "Куда угодно", width: 83)
            }
            .buttonStyle(PlainButtonStyle())
            
            NavigationLink {
                Text("Выходные")
            } label: {
                HintView(color: .testDarkBlue, imageName: "calendar", text: "Выходные", width: 70   )
            }
            .foregroundStyle(.primary)
            
            NavigationLink {
                Text("Горячие билеты")
            } label: {
                HintView(color: .testRed, imageName: "flame.fill", text: "Горячие билеты", width: 65)
            }
            .foregroundStyle(.primary)
        }
    }
}

#Preview {
    HintRowView()
        .environmentObject(UserTicket())
        .preferredColorScheme(.dark)
}

struct HintView: View {
    var color: Color
    var imageName: String
    var text: String
    var width: CGFloat
    
    var body: some View {
        VStack(spacing: 8) {
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 48, height: 48)
                .foregroundStyle(color)
                .overlay {
                    Image(systemName: imageName)
                        .font(.title2)
                }
            
            Text2(text)
        }
        .frame(width: width)
        .multilineTextAlignment(.center)
    }
}
