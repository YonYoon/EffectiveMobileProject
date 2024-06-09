//
//  ChosenCitiesSearchFieldView.swift
//  Test
//
//  Created by Zhansen Zhalel on 08.06.2024.
//

import SwiftUI

struct ChosenCitiesSearchFieldView: View {
    @Binding var isPresented: Bool
    @EnvironmentObject var model: TicketViewModel
    
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
                    TextField("Откуда - Москва", text: $model.origin)
                    
                    Button {
                        replace(&model.origin, and: &model.destination)
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
                    TextField("Куда - Турция", text: $model.destination)
                    
                    if !model.destination.isEmpty {
                        Button {
                            model.destination = ""
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

#Preview {
    ChosenCitiesSearchFieldView(isPresented: .constant(true))
        .environmentObject(TicketViewModel())
        .preferredColorScheme(.dark)
}
