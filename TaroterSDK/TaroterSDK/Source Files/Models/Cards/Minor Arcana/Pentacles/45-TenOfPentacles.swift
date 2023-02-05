//
//  45-TenOfPentacles.swift
//  TaroterSDK
//
//  Created by Jakub Dąbrowski on 20/01/2023.
//

import Foundation

struct TenOfPentaclesCard: TarotCard {
    var name: String = "Ten of Pentacles"
    var arcana: Arcana = .minor
    var yesOrNo: String = "Yes"
    var zodiacSign: String = ""
    var numerology: Int = 300
    var time: String = ""
    var meanings: Meanings = (positive: [], negative: [])
    var id: Int = 45
}
