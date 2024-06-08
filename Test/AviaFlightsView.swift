//
//  AviaFlightsView.swift
//  Test
//
//  Created by Zhansen Zhalel on 07.06.2024.
//

import SwiftUI

struct AviaFlightsView: View {
    @Binding var isPresented: Bool
    @Binding var fromWhere: String
    @Binding var toWhere: String
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            
            VStack {
                ChosenCitiesSearchFieldView(isPresented: $isPresented, fromWhere: $fromWhere, toWhere: $toWhere)
                
                Spacer()
            }
            .padding()
            .padding(.top, 31)
        }
    }
}

#Preview {
    AviaFlightsView(isPresented: .constant(true), fromWhere: .constant("Минск"), toWhere: .constant("Сочи"))
        .preferredColorScheme(.dark)
}

struct ChosenCitiesSearchFieldView: View {
    @Binding var isPresented: Bool
    @Binding var fromWhere: String
    @Binding var toWhere: String
    
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
                        replace(&fromWhere, with: &toWhere)
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
                    TextField("Куда - Турция", text: $toWhere)
                    
                    if !toWhere.isEmpty {
                        Button {
                            toWhere = ""
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
    
    func replace(_ x: inout String, with y: inout String) {
        let temp = x
        x = y
        y = temp
    }
}
