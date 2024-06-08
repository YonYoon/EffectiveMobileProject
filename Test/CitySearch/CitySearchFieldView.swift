//
//  CitySearchFieldView.swift
//  Test
//
//  Created by Zhansen Zhalel on 08.06.2024.
//

import SwiftUI

struct CitySearchFieldView: View {
    @Binding var isAviaFlightsPresented: Bool
    @Binding var origin: String
    @Binding var destination: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "airplane")
                TextField("Откуда - Москва", text: $origin)
            }
            
            Divider()
                .overlay {
                    Color(.testGrey4)
                }
                .padding(.vertical, 8)
            
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Куда - Турция", text: $destination)
                    .onSubmit {
                        isAviaFlightsPresented.toggle()
                    }
                
                if !destination.isEmpty {
                    Button {
                        destination = ""
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
    CitySearchFieldView(isAviaFlightsPresented: .constant(false), origin: .constant("Минск"), destination: .constant("Сочи"))
        .preferredColorScheme(.dark)
}
