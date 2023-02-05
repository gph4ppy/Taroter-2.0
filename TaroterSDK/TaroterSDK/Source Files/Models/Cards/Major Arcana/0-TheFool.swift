//
//  0-TheFool.swift
//  TaroterSDK
//
//  Created by Jakub Dąbrowski on 06/11/2022.
//

import Foundation

struct TheFoolCard: TarotCard {
    var name: String = "The Fool"
    var arcana: Arcana = .major
    var yesOrNo: String = "Yes"
    var zodiacSign: String = ""
    var numerology: Int = 300
    var time: String = ""
    var meanings: Meanings = (positive: [
        "beginnings",
        "carefree",
        "innocence",
        "joy",
        "new experiences",
        "new ways",
        "novelty",
        "optimism",
        "self-confidence",
        "spontaneity"
    ], negative: [
        "immaturity",
        "loss of opportunity",
        "naivety",
        "recklessness",
        "stupidity",
        "unnecessary risk",
        "wait before making a decision"
    ])
    var id: Int = 0
}
