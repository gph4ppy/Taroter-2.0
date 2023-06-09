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
    /// A property indicating whether this view is presented
    /// with the TabBar. If so, the padding will be applied,
    /// so the TabBar doesn't cover the bottom of this view.
    var isPresentedWithTabBar: Bool = true
    /// A corner radius used for grid styling.
    private let cornerRadius: CGFloat = 24
    /// A property used for setuping the grid.
    private let columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)

    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(cards, id: \.data.id) { card in
                    NavigationLink {
                        CardDetailsView(viewModel: CardDetailsViewModel(card: card))
                    } label: {
                        CardCell(card: card, cornerRadius: cornerRadius)
                    }
                }
            }
            .padding(.bottom, isPresentedWithTabBar ? 80 : 0)
        }
        .cornerRadius(cornerRadius)
    }
}
