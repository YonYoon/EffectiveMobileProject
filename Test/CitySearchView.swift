//
//  CitySearchView.swift
//  Test
//
//  Created by Zhansen Zhalel on 06.06.2024.
//

import SwiftUI

struct CitySearchView: View {
    @State private var isAviaFlightsPresented = false
    
    @Binding var fromWhere: String
    @State private var toWhere = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                PresentationDragIndicatorView()
                    .padding(.bottom, 25)
                
                CitySearchFieldView(isAviaFlightsPresented: $isAviaFlightsPresented, fromWhere: $fromWhere, toWhere: $toWhere)
                    .padding(.bottom, 26)
                
                HintRowView(toWhere: $toWhere)
                    .padding(.bottom, 26)
                
                VStack(spacing: 8) {
                    PopularDirectionView(toWhere: $toWhere, cityImage: .stambul, cityName: "Стамбул")
                    PopularDirectionView(toWhere: $toWhere, cityImage: .sochi, cityName: "Сочи")
                    PopularDirectionView(toWhere: $toWhere, cityImage: .phuket, cityName: "Пхукет")
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
                AviaFlightsView(isPresented: $isAviaFlightsPresented, fromWhere: $fromWhere, toWhere: $toWhere)
            }
        }
    }
}

#Preview {
    CitySearchView(fromWhere: .constant("Минск"))
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

struct HintRowView: View {
    @Binding var toWhere: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            NavigationLink {
                Text("Сложный маршрут")
            } label: {
                HintView(color: .testDarkGreen, imageName: "command", text: "Сложный маршрут", width: 70)
            }
            .foregroundStyle(.primary)
            
            Button {
                toWhere = "Куда угодно"
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

struct PopularDirectionView: View {
    @Binding var toWhere: String
    
    var cityImage: ImageResource
    var cityName: String
    
    var body: some View {
        Button {
            toWhere = cityName
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
