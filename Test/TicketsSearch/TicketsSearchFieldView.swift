//
//  TicketsSearchFieldView.swift
//  Test
//
//  Created by Zhansen Zhalel on 08.06.2024.
//

import SwiftUI

struct TicketsSearchFieldView: View {
    @SceneStorage("TicketsSearchView.origin") private var origin = ""
    @State private var isPresented = false
    
    var body: some View {
        Group {
            HStack(spacing: 16) {
                Image(systemName: "magnifyingglass")
                
                VStack {
                    TextField("Откуда - Москва", text: $origin)
                    
                    Divider()
                        .overlay {
                            Color(.testGrey6)
                        }
                    
                    HStack {
                        Button("Куда - Турция") {
                            isPresented.toggle()
                        }
                        .foregroundStyle(.tertiary)
                        .sheet(isPresented: $isPresented) {
                            CitySearchView(origin: $origin)
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
}
