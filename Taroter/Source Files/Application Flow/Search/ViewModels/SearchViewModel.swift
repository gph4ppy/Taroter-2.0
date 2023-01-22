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
    /// A property containing the current search query typed by the user.
    @Published var searchText: String = ""
    /// An array storing all the cards containing the search query in their data.
    @Published var searchResults: [TarotCards] = []

    /// This method filters an array with all the Tarot cards and assigns the result
    /// to the `searchResults` property, which is displayed by the View.
    func search() {
        let filteredCards = TarotCards.allCases.filter { doesCardContainSearchQuery(card: $0) }
        searchResults = filteredCards
    }

    /// A method used for validating whether any card contains
    /// the search query typed by the user.
    /// - Parameter card: a card that is about to be checked.
    /// - Returns: a value indicating whether any card contains the search text.
    private func doesCardContainSearchQuery(card: TarotCards) -> Bool {
        card.data.name.contains(searchText) ||
        card.data.zodiacSign.contains(searchText) ||
        card.data.time.contains(searchText) ||
        card.data.meanings.positive.contains(searchText) ||
        card.data.meanings.negative.contains(searchText)
    }
}
