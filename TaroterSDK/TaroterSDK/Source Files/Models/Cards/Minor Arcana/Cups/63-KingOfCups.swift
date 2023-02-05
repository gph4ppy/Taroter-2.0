//
//  63-KingOfCups.swift
//  TaroterSDK
//
//  Created by Jakub Dąbrowski on 20/01/2023.
//

import Foundation

struct KingOfCupsCard: TarotCard {
    var name: String = "King of Cups"
    var arcana: Arcana = .minor
    var yesOrNo: String = "Yes"
    var zodiacSign: String = ""
    var numerology: Int = 300
    var time: String = ""
    var meanings: Meanings = (positive: [], negative: [])
    var id: Int = 63
}
