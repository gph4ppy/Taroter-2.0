//
//  13-Death.swift
//  TaroterSDK
//
//  Created by Jakub Dąbrowski on 29/12/2022.
//

import Foundation

struct DeathCard: TarotCard {
    var name: String = "Death"
    var arcana: Arcana = .major
    var yesOrNo: String = "Yes"
    var zodiacSign: String = ""
    var numerology: Int = 300
    var time: String = ""
    var meanings: Meanings = (positive: [], negative: [])
    var id: Int = 13
}
