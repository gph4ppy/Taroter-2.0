//
//  SearchViewModel.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 20/01/2023.
//

import Foundation
import TaroterSDK

@MainActor
final class SearchViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var searchResults: [TarotCards] = []

    func search(by query: String) {
        let filteredCards = TarotCards.allCases.filter { doesCardContainSearchQuery(card: $0) }
        searchResults = filteredCards
    }

    private func doesCardContainSearchQuery(card: TarotCards) -> Bool {
        card.data.name.contains(searchText) ||
        card.data.zodiacSign.contains(searchText) ||
        card.data.time.contains(searchText) ||
        card.data.meanings.positive.contains(searchText) ||
        card.data.meanings.negative.contains(searchText)
    }
}
