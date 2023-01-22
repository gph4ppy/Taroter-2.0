//
//  CardCell.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 22/01/2023.
//

import SwiftUI
import TaroterSDK

struct CardCell: View {
    let card: TarotCards
    let cornerRadius: CGFloat

    var body: some View {
        VStack(spacing: 10) {
            Image(card.data.name)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .cornerRadius(cornerRadius)

            Text(card.data.name)
                .fontWeight(.semibold)
                .font(.system(size: 14))
                .multilineTextAlignment(.center)
                .foregroundColor(TRColor.snow)
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}
