//
//  CitySearchView.swift
//  Test
//
//  Created by Zhansen Zhalel on 06.06.2024.
//

import SwiftUI

struct CitySearchView: View {
    @State private var isAviaFlightsPresented = false
    
    @Binding var origin: String
    @State private var destination = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                PresentationDragIndicatorView()
                    .padding(.bottom, 25)
                
                CitySearchFieldView(isAviaFlightsPresented: $isAviaFlightsPresented, origin: $origin, destination: $destination)
                    .padding(.bottom, 26)
                
                HintRowView(destination: $destination)
                    .padding(.bottom, 26)
                
                VStack(spacing: 8) {
                    PopularDirectionView(destination: $destination, cityImage: .stambul, cityName: "Стамбул")
                    PopularDirectionView(destination: $destination, cityImage: .sochi, cityName: "Сочи")
                    PopularDirectionView(destination: $destination, cityImage: .phuket, cityName: "Пхукет")
                }
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(Color(red: 0.18, green: 0.19, blue: 0.21))
                }
                
                Spacer()
            }
            .padding()
            .fullScreenCover(isPresented: $isAviaFlightsPresented) {
                AviaFlightsView(isPresented: $isAviaFlightsPresented, origin: $origin, destination: $destination)
            }
        }
    }
}

#Preview {
    CitySearchView(origin: .constant("Минск"))
        .preferredColorScheme(.dark)
        .presentationBackground(Color(red: 36/255, green: 37/255, blue: 41/255))
}

struct PresentationDragIndicatorView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 38, height: 5)
            .foregroundStyle(.testGrey5)
    }
}

struct PopularDirectionView: View {
    @Binding var destination: String
    
    var cityImage: ImageResource
    var cityName: String
    
    var body: some View {
        Button {
            destination = cityName
        } label: {
            VStack(alignment: .leading) {
                HStack {
                    Image(cityImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Title3(cityName)
                        Text2("Популярное направление")
                            .foregroundStyle(.testGrey5)
                    }
                }
                
                Divider()
            }
            .padding(.top, 8)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
