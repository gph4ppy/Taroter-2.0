//
//  TarotCard.swift
//  TaroterSDK
//
//  Created by Jakub Dąbrowski on 06/11/2022.
//

import Foundation

public enum TarotCards: CaseIterable {
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

    public var data: TarotCard {
        switch self {
        case .fool: return TheFoolCard()
        case .magician: return TheMagicianCard()
        case .highPriestess: return TheHighPriestessCard()
        case .empress: return TheEmpressCard()
        case .emperor: return TheEmperorCard()
        case .hierophant: return TheFoolCard()
        case .lovers: return TheFoolCard()
        case .chariot: return TheFoolCard()
        case .strenght: return TheFoolCard()
        case .hermit: return TheFoolCard()
        case .wheelOfFortune: return TheFoolCard()
        case .justice: return TheFoolCard()
        case .hangedMan: return TheFoolCard()
        case .death: return TheFoolCard()
        case .temperance: return TheFoolCard()
        case .devil: return TheFoolCard()
        case .tower: return TheFoolCard()
        case .star: return TheFoolCard()
        case .moon: return TheFoolCard()
        case .sun: return TheFoolCard()
        case .judgement: return TheFoolCard()
        case .world: return TheFoolCard()
        }
    }
}
