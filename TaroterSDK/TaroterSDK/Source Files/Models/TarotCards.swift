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
        case .hierophant: return TheHierophantCard()
        case .lovers: return TheLoversCard()
        case .chariot: return TheChariotCard()
        case .strenght: return StrengthCard()
        case .hermit: return TheHermitCard()
        case .wheelOfFortune: return WheelOfFortuneCard()
        case .justice: return JusticeCard()
        case .hangedMan: return TheHangedManCard()
        case .death: return DeathCard()
        case .temperance: return TemperanceCard()
        case .devil: return TheDevilCard()
        case .tower: return TheTowerCard()
        case .star: return TheStarCard()
        case .moon: return TheMoonCard()
        case .sun: return TheFoolCard()
        case .judgement: return TheFoolCard()
        case .world: return TheFoolCard()
        }
    }
}
