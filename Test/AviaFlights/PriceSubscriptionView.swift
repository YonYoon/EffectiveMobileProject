//
//  PriceSubscriptionView.swift
//  Test
//
//  Created by Zhansen Zhalel on 09.06.2024.
//

import SwiftUI

struct PriceSubscriptionView: View {
    @Binding var priceSubscription: Bool
    
    var body: some View {
        Toggle(isOn: $priceSubscription) {
            Label(
                title: { Text1("Подписка на цену") },
                icon: { Image(systemName: "bell.fill").foregroundStyle(.testBlue)
                    .font(.title2)}
            )
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(.testGrey2)
        }
    }
}

#Preview {
    PriceSubscriptionView(priceSubscription: .constant(false))
        .preferredColorScheme(.dark)
}
