//
//  AviaFlightsView.swift
//  Test
//
//  Created by Zhansen Zhalel on 07.06.2024.
//

import SwiftUI

struct AviaFlightsView: View {
    @StateObject private var ticketsFetcher = TicketOfferCollectionFetcher()
    
    @EnvironmentObject var ticket: TicketViewModel
    
    @Binding var isPresented: Bool
    
    @State private var isAllTicketsPresented = false
    
    @State private var showDepartureCalendar = false
    @State private var showReturnCalendar = false
    @State private var departureDate = Date.now
    @State private var returnDate = Date()
    
    @State private var priceSubscription = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.black)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack {
                        ChosenCitiesSearchFieldView(isPresented: $isPresented)
                            .padding(.bottom, 15)
                        
                        TicketCustomizationView(showDepartureCalendar: $showDepartureCalendar, showReturnCalendar: $showReturnCalendar, departureDate: $departureDate)
                        
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
                            isAllTicketsPresented = true
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
            }
            .task {
                do {
                    try await ticketsFetcher.fetchOffers()
                } catch {
                    print(error)
                }
            }
            .navigationDestination(isPresented: $isAllTicketsPresented) {
                AllTicketsView(isPresented: $isAllTicketsPresented)
                    .navigationBarBackButtonHidden()
            }
        }
    }
}

#Preview {
    AviaFlightsView(isPresented: .constant(true))
        .environmentObject(TicketViewModel())
        .preferredColorScheme(.dark)
}
