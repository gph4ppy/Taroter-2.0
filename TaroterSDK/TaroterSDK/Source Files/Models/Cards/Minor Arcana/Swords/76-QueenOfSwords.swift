//
//  76-QueenOfSwords.swift
//  TaroterSDK
//
//  Created by Jakub Dąbrowski on 20/01/2023.
//

import Foundation

struct QueenOfSwordsCard: TarotCard {
    var name: String = "Queen of Swords"
    var arcana: Arcana = .minor
    var yesOrNo: String = "Yes"
    var zodiacSign: String = ""
    var numerology: Int = 300
    var time: String = ""
    var meanings: Meanings = (positive: [], negative: [])
    var id: Int = 76
}
