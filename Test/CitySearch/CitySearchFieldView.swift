//
//  CitySearchFieldView.swift
//  Test
//
//  Created by Zhansen Zhalel on 08.06.2024.
//

import SwiftUI

struct CitySearchFieldView: View {
    @Binding var isAviaFlightsPresented: Bool
    @EnvironmentObject var model: Model
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "airplane")
                TextField("Откуда - Москва", text: $model.origin)
            }
            
            Divider()
                .overlay {
                    Color(.testGrey4)
                }
                .padding(.vertical, 8)
            
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Куда - Турция", text: $model.destination)
                    .onSubmit {
                        isAviaFlightsPresented.toggle()
                    }
                
                if !model.destination.isEmpty {
                    Button {
                        model.destination = ""
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
        .environmentObject(Model())
        .preferredColorScheme(.dark)
}
