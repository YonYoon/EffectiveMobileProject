//
//  TicketCustomizationView.swift
//  Test
//
//  Created by Zhansen Zhalel on 09.06.2024.
//

import SwiftUI

struct TicketCustomizationView: View {
    @Binding var showDepartureCalendar: Bool
    @Binding var showReturnCalendar: Bool
    @Binding var departureDate: Date
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Button {
                    withAnimation(.default) {
                        if showDepartureCalendar { showDepartureCalendar = false }
                        showReturnCalendar.toggle()
                    }
                } label: {
                    HStack {
                        Image(systemName: "plus")
                            .fontWeight(.medium)
                        
                        Title4("обратно")
                            .italic()
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal, 10)
                    .background {
                        RoundedRectangle(cornerRadius: 50)
                            .foregroundStyle(Color(red: 0.18, green: 0.19, blue: 0.21))
                    }
                }
                .buttonStyle(PlainButtonStyle())
                
                Button {
                    withAnimation(.default) {
                        if showReturnCalendar { showReturnCalendar = false }
                        showDepartureCalendar.toggle()
                    }
                } label: {
                    HStack {
                        Group {
                            Text(departureDate.formatted(.dateTime.day().month()))
                            + Text(", \(departureDate.formatted(.dateTime.weekday()))")
                                .foregroundStyle(.testGrey6)
                        }
                        .font(.system(size: 14))
                        .italic()
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal, 10)
                    .background {
                        RoundedRectangle(cornerRadius: 50)
                            .foregroundStyle(Color(red: 0.18, green: 0.19, blue: 0.21))
                    }
                }
                .buttonStyle(PlainButtonStyle())
                
                HStack {
                    Image(systemName: "person.fill")
                        .font(.caption)
                    
                    Title4("1,эконом")
                        .italic()
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 10)
                .background {
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundStyle(Color(red: 0.18, green: 0.19, blue: 0.21))
                }
                
                HStack {
                    Image(systemName: "slider.horizontal.3")
                        .font(.caption)
                    
                    Title4("фильтры")
                        .italic()
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 10)
                .background {
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundStyle(Color(red: 0.18, green: 0.19, blue: 0.21))
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    TicketCustomizationView(showDepartureCalendar: .constant(false), showReturnCalendar: .constant(false), departureDate: .constant(Date.now))
        .preferredColorScheme(.dark)
}
