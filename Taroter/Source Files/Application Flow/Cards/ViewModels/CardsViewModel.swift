//
//  CardsViewModel.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 15/10/2022.
//

import TaroterSDK

@MainActor
final class CardsViewModel: ObservableObject {
    /// A property storing currently selected arcana.
    @Published var selectedArcanaSection: Arcana = .all

    /// A property containing filtered array
    /// by the card's arcana.
    var filteredCards: [TarotCards] {
        if selectedArcanaSection == .all {
            return TarotCards.allCases
        } else {
            return TarotCards.allCases.filter {
                $0.data.arcana == selectedArcanaSection
            }
        }
    }
}
