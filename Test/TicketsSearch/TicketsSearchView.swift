//
//  TicketsSearchView.swift
//  Test
//
//  Created by Zhansen Zhalel on 04.06.2024.
//

import SwiftUI

struct TicketsSearchView: View {
    @ObservedObject var fetcher: OfferCollectionFetcher
    @State private var isAviaFlightsPresented = false
//    @State private var isAllTicketsPresented = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Поиск дешевых авиабилетов")
                    .modifier(Title1())
                    .foregroundStyle(Color(red: 217/255, green: 217/255, blue: 217/255))
                    .frame(width: 172)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 38)
                
                TicketsSearchFieldView(isAviaFlightsPresented: $isAviaFlightsPresented)
                
                HStack {
                    Text("Музыкально отлететь").modifier(Title1())
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
            .navigationDestination(isPresented: $isAviaFlightsPresented) {
                AviaFlightsView(isPresented: $isAviaFlightsPresented)
                    .navigationBarBackButtonHidden()
            }
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
        .environmentObject(TicketViewModel())
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
