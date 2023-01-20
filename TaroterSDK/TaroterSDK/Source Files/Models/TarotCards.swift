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

    // MARK: - Minor Arcana
    // - Wands -
    case aceOfWands
    case twoOfWands
    case threeOfWands
    case fourOfWands
    case fiveOfWands
    case sixOfWands
    case sevenOfWands
    case eightOfWands
    case nineOfWands
    case tenOfWands
    case pageOfWands
    case knightOfWands
    case queenOfWands
    case kingOfWands

    // - Pentacles -
    case aceOfPentacles
    case twoOfPentacles
    case threeOfPentacles
    case fourOfPentacles
    case fiveOfPentacles
    case sixOfPentacles
    case sevenOfPentacles
    case eightOfPentacles
    case nineOfPentacles
    case tenOfPentacles
    case pageOfPentacles
    case knightOfPentacles
    case queenOfPentacles
    case kingOfPentacles

    // - Cups -
    case aceOfCups
    case twoOfCups
    case threeOfCups
    case fourOfCups
    case fiveOfCups
    case sixOfCups
    case sevenOfCups
    case eightOfCups
    case nineOfCups
    case tenOfCups
    case pageOfCups
    case knightOfCups
    case queenOfCups
    case kingOfCups

    // - Swords -
    case aceOfSwords
    case twoOfSwords
    case threeOfSwords
    case fourOfSwords
    case fiveOfSwords
    case sixOfSwords
    case sevenOfSwords
    case eightOfSwords
    case nineOfSwords
    case tenOfSwords
    case pageOfSwords
    case knightOfSwords
    case queenOfSwords
    case kingOfSwords

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
        case .sun: return TheSunCard()
        case .judgement: return JudgementCard()
        case .world: return TheWorldCard()
        case .aceOfWands: return AceOfWandsCard()
        case .twoOfWands: return TwoOfWandsCard()
        case .threeOfWands: return ThreeOfWandsCard()
        case .fourOfWands: return FourOfWandsCard()
        case .fiveOfWands: return FiveOfWandsCard()
        case .sixOfWands: return SixOfWandsCard()
        case .sevenOfWands: return SevenOfWandsCard()
        case .eightOfWands: return EightOfWandsCard()
        case .nineOfWands: return NineOfWandsCard()
        case .tenOfWands: return TenOfWandsCard()
        case .pageOfWands: return PageOfWandsCard()
        case .knightOfWands: return KnightOfWandsCard()
        case .queenOfWands: return QueenOfWandsCard()
        case .kingOfWands: return KingOfWandsCard()
        case .aceOfPentacles: return AceOfPentaclesCard()
        case .twoOfPentacles: return TwoOfPentaclesCard()
        case .threeOfPentacles: return ThreeOfPentaclesCard()
        case .fourOfPentacles: return FourOfPentaclesCard()
        case .fiveOfPentacles: return FiveOfPentaclesCard()
        case .sixOfPentacles: return SixOfPentaclesCard()
        case .sevenOfPentacles: return SevenOfPentaclesCard()
        case .eightOfPentacles: return EightOfPentaclesCard()
        case .nineOfPentacles: return NineOfPentaclesCard()
        case .tenOfPentacles: return TenOfPentaclesCard()
        case .pageOfPentacles: return PageOfPentaclesCard()
        case .knightOfPentacles: return KnightOfPentaclesCard()
        case .queenOfPentacles: return QueenOfPentaclesCard()
        case .kingOfPentacles: return KingOfPentaclesCard()
        case .aceOfCups: return AceOfCupsCard()
        case .twoOfCups: return TwoOfCupsCard()
        case .threeOfCups: return ThreeOfCupsCard()
        case .fourOfCups: return FourOfCupsCard()
        case .fiveOfCups: return FiveOfCupsCard()
        case .sixOfCups: return SixOfCupsCard()
        case .sevenOfCups: return SevenOfCupsCard()
        case .eightOfCups: return EightOfCupsCard()
        case .nineOfCups: return NineOfCupsCard()
        case .tenOfCups: return TenOfCupsCard()
        case .pageOfCups: return PageOfCupsCard()
        case .knightOfCups: return KnightOfCupsCard()
        case .queenOfCups: return QueenOfCupsCard()
        case .kingOfCups: return KingOfCupsCard()
        case .aceOfSwords: return AceOfSwordsCard()
        case .twoOfSwords: return TwoOfSwordsCard()
        case .threeOfSwords: return ThreeOfSwordsCard()
        case .fourOfSwords: return FourOfSwordsCard()
        case .fiveOfSwords: return FiveOfSwordsCard()
        case .sixOfSwords: return SixOfSwordsCard()
        case .sevenOfSwords: return SevenOfSwordsCard()
        case .eightOfSwords: return EightOfSwordsCard()
        case .nineOfSwords: return NineOfSwordsCard()
        case .tenOfSwords: return TenOfSwordsCard()
        case .pageOfSwords: return PageOfSwordsCard()
        case .knightOfSwords: return KnightOfSwordsCard()
        case .queenOfSwords: return QueenOfSwordsCard()
        case .kingOfSwords: return KingOfSwordsCard()
        }
    }
}
