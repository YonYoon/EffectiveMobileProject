//
//  TicketCardView.swift
//  Test
//
//  Created by Zhansen Zhalel on 09.06.2024.
//

import SwiftUI

struct Badge: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .topLeading) {
            content
            if !text.isEmpty {
                BadgeView(text: text)
                    .padding(.top, -8)
            }
        }
    }
}

struct TicketCardView: View {
    let ticket: Ticket
    var flightTime: String {
        let difference = Calendar.current.dateComponents([.hour], from: ticket.departure.date, to: ticket.arrival.date)
    
        return "\(difference.hour ?? 0)"
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(ticket.price.value) ₽")
                    .modifier(Title1())
                    .fontWeight(.semibold)
                    .padding(.bottom)
                
                HStack {
                    Circle()
                        .foregroundStyle(.testRed)
                        .frame(width: 24, height: 24)
                    
                    HStack(alignment: .top, spacing: 16) {
                        HStack(alignment: .firstTextBaseline) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(ticket.departure.date.formatted(date: .omitted, time: .shortened))
                                Text(ticket.departure.airport).foregroundStyle(.testGrey6)
                            }
                            
                            Text("-")
                                .foregroundStyle(.testGrey6)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(ticket.arrival.date.formatted(date: .omitted, time: .shortened))
                                Text(ticket.arrival.airport).foregroundStyle(.testGrey6)
                            }
                        }
                        .italic()
                        
                        if ticket.hasTransfer {
                            Text("\(flightTime)ч в пути")
                        } else {
                            Text("\(flightTime)ч в пути")
                            + Text(" / ").foregroundStyle(.testGrey6)
                            + Text("Без пересадок")
                        }
                    }
                    .font(.system(size: 14))
                }
            }
            
            Spacer()
        }
        .padding([.top, .bottom, .leading])
        .background {
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(.testGrey1)
        }
    }
}

#Preview {
    TicketCardView(
        ticket: Ticket(
            id: 100,
            badge: "Самый удобный",
            price: Price(value: 1999),
            providerName: "На сайте Купибилет",
            company: "Якутия",
            departure: Ticket.Flight(
                town: "Москва",
                date: Date.now,
                airport: "VKO"
            ),
            arrival: Ticket.Flight(
                town: "Сочи",
                date: Date.now,
                airport: "AER"
            ),
            hasTransfer: false,
            hasVisaTransfer: false,
            luggage: Ticket.Luggage(
                hasLuggage: false,
                price: Price(value: 1082)
            ),
            handLuggage: Ticket.HandLuggage(
                hasHandLuggage: true,
                size: "55x20x40"
            ),
            isReturnable: false,
            isExchangable: true
        )
    )
    .preferredColorScheme(.dark)
    .badged(with: "Самый удобный")
    .padding()
}

struct BadgeView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.system(size: 14))
            .italic()
            .padding(.vertical, 2)
            .padding(.horizontal, 10)
            .background {
                RoundedRectangle(cornerRadius: 50)
                    .foregroundStyle(.testBlue)
            }

    }
}

#Preview {
    BadgeView(text: "Самый удобный")
        .preferredColorScheme(.dark)
}

extension View {
    func badged(with text: String) -> some View {
        modifier(Badge(text: text))
    }
}
