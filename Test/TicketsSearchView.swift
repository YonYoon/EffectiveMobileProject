//
//  TicketsSearchView.swift
//  Test
//
//  Created by Zhansen Zhalel on 04.06.2024.
//

import SwiftUI

struct TicketsSearchView: View {
    @ObservedObject var fetcher: OfferCollectionFetcher
    
    var body: some View {
        NavigationStack {
            VStack {
                Title1("Поиск дешевых авиабилетов")
                    .foregroundStyle(Color(red: 217/255, green: 217/255, blue: 217/255))
                    .frame(width: 172)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 38)
                
                TicketsSearchFieldView()
                
                HStack {
                    Title1("Музыкально отлететь")
                    Spacer()
                }
                .padding(.top, 32)
                .padding(.bottom, 26)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 67) {
                        ForEach(fetcher.offers) { offer in
                            MusicTravelView(offer: offer)
                        }
                    }
                }

                Spacer()
            }
            .padding()
        }
        .preferredColorScheme(.dark)
        .task {
            do {
                try await fetcher.fetchOffers()
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    TicketsSearchView(fetcher: OfferCollectionFetcher())
}

struct TicketsSearchFieldView: View {
    @SceneStorage("TicketsSearchView.fromWhere") private var fromWhere = ""
    @State private var toWhere = ""
    @State private var isPresented = false
    
    var body: some View {
        Group {
            HStack(spacing: 16) {
                Image(systemName: "magnifyingglass")
                
                VStack {
                    TextField("Откуда - Москва", text: $fromWhere)
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
                            CitySearchView(fromWhere: $fromWhere)
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

struct MusicTravelView: View {
    var offer: Offer
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(offer.imageName)
                .resizable()
                .frame(width: 132, height: 132)
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 16))
            Title3(offer.title)
            Text2(offer.town)
            Label("от \(offer.price.value) ₽", systemImage: "airplane")
                .font(.system(size: 14))
        }
    }
}
