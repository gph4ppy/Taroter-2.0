//
//  TarotCard.swift
//  TaroterSDK
//
//  Created by Jakub Dąbrowski on 06/11/2022.
//

import Foundation

enum TarotCards: CaseIterable {
    // MARK: - Major Arcana
    case fool
    case magician
    case highPriestess
    case empress
    case emperor
    case hierophant
    case lovers
    case chariot
    case strenght
    case hermit
    case wheelOfFortune
    case justice
    case hangedMan
    case death
    case temperance
    case devil
    case tower
    case star
    case moon
    case sun
    case judgement
    case world
}

struct TarotCard {
    let name: String
    let arcana: Arcana
    let yesOrNo: String
    let zodiacSign: String
    let numerology: Int
    let meanings: [String]
}
