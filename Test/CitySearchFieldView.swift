//
//  CitySearchFieldView.swift
//  Test
//
//  Created by Zhansen Zhalel on 08.06.2024.
//

import SwiftUI

struct CitySearchFieldView: View {
    @Binding var isAviaFlightsPresented: Bool
    @Binding var fromWhere: String
    @Binding var toWhere: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "airplane")
                TextField("Откуда - Москва", text: $fromWhere)
            }
            
            Divider()
                .overlay {
                    Color(.testGrey4)
                }
                .padding(.vertical, 8)
            
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Куда - Турция", text: $toWhere)
                    .onSubmit {
                        isAviaFlightsPresented.toggle()
                    }
                
                if !toWhere.isEmpty {
                    Button {
                        toWhere = ""
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
    CitySearchFieldView(isAviaFlightsPresented: .constant(false), fromWhere: .constant("Минск"), toWhere: .constant("Сочи"))
        .preferredColorScheme(.dark)
}
