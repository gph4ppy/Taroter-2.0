//
//  68-FiveOfSwords.swift
//  TaroterSDK
//
//  Created by Jakub Dąbrowski on 20/01/2023.
//

import Foundation

struct FiveOfSwordsCard: TarotCard {
    var name: String = "Five of Swords"
    var arcana: Arcana = .minor
    var yesOrNo: String = "Yes"
    var zodiacSign: String = ""
    var numerology: Int = 300
    var time: String = ""
    var meanings: Meanings = (positive: [], negative: [])
    var id: Int = 68
}
