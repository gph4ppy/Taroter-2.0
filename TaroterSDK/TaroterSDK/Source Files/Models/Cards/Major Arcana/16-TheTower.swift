//
//  16-TheTower.swift
//  TaroterSDK
//
//  Created by Jakub Dąbrowski on 20/01/2023.
//

import Foundation

struct TheTowerCard: TarotCard {
    var name: String = "The Tower"
    var arcana: Arcana = .major
    var yesOrNo: String = "Yes"
    var zodiacSign: String = ""
    var numerology: Int = 300
    var time: String = ""
    var meanings: Meanings = (positive: [], negative: [])
    var id: Int = 16
}
