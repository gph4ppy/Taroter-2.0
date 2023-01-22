//
//  CardsGrid.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 06/11/2022.
//

import SwiftUI
import TaroterSDK

/// A view used for displaying the Tarot Cards in the grid.
struct CardsGrid: View {
    /// A property containing all cards displayed in a grid.
    let cards: [TarotCards]
    /// A corner radius used for grid styling.
    private let cornerRadius: CGFloat = 24
    /// A property used for setuping the grid.
    private let columns: [GridItem] = [
        GridItem(
            .adaptive(minimum: 110),
            spacing: 20,
            alignment: .top
        )
    ]

    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(cards, id: \.data.id) { card in
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
                    }
                    .frame(maxHeight: .infinity, alignment: .top)
                }
            }
        }
        .cornerRadius(cornerRadius)
    }
}
