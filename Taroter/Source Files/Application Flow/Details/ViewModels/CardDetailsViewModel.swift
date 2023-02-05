//
//  CardDetailsViewModel.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 22/01/2023.
//

import Foundation
import TaroterSDK

@MainActor
final class CardDetailsViewModel: ObservableObject {
    let card: TarotCards

    init(card: TarotCards) {
        self.card = card
    }
}
