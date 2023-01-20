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
    /// A type of arcana to be displayed.
    let displayedArcana: Arcana
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
    /// A property containing filtered array
    /// by the card's arcana.
    private var filteredCards: [TarotCards] {
        if displayedArcana == .all {
            return TarotCards.allCases
        } else {
            return TarotCards.allCases.filter {
                $0.data.arcana == displayedArcana
            }
        }
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(filteredCards, id: \.data.id) { card in
                    Image(card.data.name)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .overlay(alignment: .bottom) {
                            Color.black.opacity(0.6)
                                .frame(height: 44)

                            Text(card.data.name)
                                .fontWeight(.semibold)
                                .font(.system(size: 14))
                                .lineLimit(1)
                                .padding(.horizontal, 2)
                        }
                        .cornerRadius(cornerRadius)
                }
            }
        }
        .cornerRadius(cornerRadius)
    }
}
