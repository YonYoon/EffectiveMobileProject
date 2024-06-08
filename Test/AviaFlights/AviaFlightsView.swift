//
//  AviaFlightsView.swift
//  Test
//
//  Created by Zhansen Zhalel on 07.06.2024.
//

import SwiftUI

struct AviaFlightsView: View {
    @Binding var isPresented: Bool
    @Binding var origin: String
    @Binding var destination: String
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            
            VStack {
                ChosenCitiesSearchFieldView(isPresented: $isPresented, fromWhere: $origin, destination: $destination)
                
                Spacer()
            }
            .padding()
            .padding(.top, 31)
        }
    }
}

#Preview {
    AviaFlightsView(isPresented: .constant(true), origin: .constant("Минск"), destination: .constant("Сочи"))
        .preferredColorScheme(.dark)
}

struct ChosenCitiesSearchFieldView: View {
    @Binding var isPresented: Bool
    @Binding var fromWhere: String
    @Binding var destination: String
    
    var body: some View {
        HStack {
            Button {
                isPresented = false
            } label: {
                Image(systemName: "arrow.left")
                    .fontWeight(.medium)
            }
            .buttonStyle(PlainButtonStyle())
            
            VStack {
                HStack {
                    TextField("Откуда - Москва", text: $fromWhere)
                    
                    Button {
                        replace(&fromWhere, and: &destination)
                    } label: {
                        Image(systemName: "arrow.up.arrow.down")
                            .font(.footnote)
                            .padding(.trailing, 5)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
                Divider()
                    .overlay {
                        Color(.testGrey4)
                    }
                    .padding(.vertical, 8)
                
                HStack {
                    TextField("Куда - Турция", text: $destination)
                    
                    if !destination.isEmpty {
                        Button {
                            destination = ""
                        } label: {
                            Image(systemName: "xmark")
                                .font(.footnote)
                                .padding(.trailing, 8)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(Color(red: 0.18, green: 0.19, blue: 0.21))
        }
    }
    
    func replace(_ x: inout String, and y: inout String) {
        let temp = x
        x = y
        y = temp
    }
}
