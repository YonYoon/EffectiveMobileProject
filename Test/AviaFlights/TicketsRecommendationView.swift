//
//  TicketsRecommendationView.swift
//  Test
//
//  Created by Zhansen Zhalel on 08.06.2024.
//

import SwiftUI

struct TicketsRecommendationView: View {
    var tickets: [TicketOffer]
    
    var body: some View {
        VStack(alignment: .leading) {
            Title2("Прямые рельсы")
            
            ForEach(tickets) { ticket in
                VStack(spacing: 10) {
                    HStack(alignment: .top) {
                        Circle()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(ticket.color)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            HStack {
                                Title4(ticket.title)
                                    .italic()
                                
                                Spacer()
                                
                                Group {
                                    Text("\(ticket.price.value) ₽")
                                        .italic()
                                    
                                    Image(systemName: "chevron.right")
                                }
                                .font(.system(size: 14))
                                .foregroundStyle(.blue)
                            }
                            
                            Text2(ticket.timeRangeString)
                                .lineLimit(1)
                        }
                    }
                    .padding(.top, 8)
                    
                    Divider()
                        .overlay {
                            Color(.testGrey4)
                        }
                }
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(.testGrey1)
        }
        .padding(.top, 15)
    }
}

#Preview {
    TicketsRecommendationView(tickets: [])
        .preferredColorScheme(.dark)
}
