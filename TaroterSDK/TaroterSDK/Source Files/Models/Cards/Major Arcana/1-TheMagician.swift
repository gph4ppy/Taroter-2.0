//
//  1-TheMagician.swift
//  TaroterSDK
//
//  Created by Jakub Dąbrowski on 06/11/2022.
//

import Foundation

struct TheMagicianCard: TarotCard {
    var name: String = "The Magician"
    var arcana: Arcana = .major
    var yesOrNo: String = "Yes"
    var zodiacSign: String = ""
    var numerology: Int = 300
    var time: String = ""
    var meanings: Meanings = (positive: [
        "a new beginning",
        "action time",
        "assertiveness",
        "awareness",
        "having all the necessary tools",
        "individualism",
        "initiative",
        "knowledge",
        "strong will",
        "taking a risk",
        "taking action"
    ], negative: [
        "inability to take action",
        "indecision",
        "lack of courage",
        "liar",
        "manipulation or manipuator",
        "shyness",
        "undervaluation"
    ])
    var id: Int = 1
}
