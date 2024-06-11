//
//  AviaFlightsView.swift
//  Test
//
//  Created by Zhansen Zhalel on 07.06.2024.
//

import SwiftUI

struct AviaFlightsView: View {
    @StateObject private var ticketsFetcher = TicketOfferCollectionFetcher()
    
    @EnvironmentObject var ticket: UserTicket
    @EnvironmentObject var coordinator: Coordinator
    
    @State private var isAllTicketsPresented = false
    
    @State private var showDepartureCalendar = false
    @State private var showReturnCalendar = false
    @State private var departureDate = Date.now
    @State private var returnDate = Date()
    
    @State private var priceSubscription = false
    
    var body: some View {
        ScrollView {
            VStack {
                ChosenCitiesSearchFieldView()
                    .padding(.bottom, 15)
                
                TicketCustomizationView(showDepartureCalendar: $showDepartureCalendar, showReturnCalendar: $showReturnCalendar, departureDate: $departureDate)
                    .padding(.horizontal, -16)
                
                if showReturnCalendar {
                    DatePicker("Дата обратного билета", selection: $returnDate, displayedComponents: .date)
                        .datePickerStyle(.graphical)
                }
                
                if showDepartureCalendar {
                    DatePicker("Дата отправления", selection: $departureDate, displayedComponents: .date)
                        .datePickerStyle(.graphical)
                }
                
                TicketsRecommendationView(tickets: ticketsFetcher.offers)
                    .padding(.bottom, 18)
                
                Button {
                    coordinator.toggle(.allTickets)
                } label: {
                    Text("Посмотреть все билеты")
                        .italic()
                        .frame(maxWidth: .infinity, minHeight: 42)
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(.testDarkBlue)
                        }
                }
                .padding(.bottom, 24)
                .buttonStyle(PlainButtonStyle())
                
                PriceSubscriptionView(priceSubscription: $priceSubscription)
                
                Spacer()
            }
            .padding()
            .padding(.top, 31)
        }
        .scrollBounceBehavior(.basedOnSize)
        .task {
            do {
                try await ticketsFetcher.fetchOffers()
            } catch {
                print(error)
            }
        }
        .navigationDestination(isPresented: $coordinator.isAllTicketsPresented) {
            AllTicketsView()
                .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    AviaFlightsView()
        .environmentObject(UserTicket())
        .environmentObject(Coordinator())
        .preferredColorScheme(.dark)
}
