//
//  2-TheHighPriestess.swift
//  TaroterSDK
//
//  Created by Jakub Dąbrowski on 06/11/2022.
//

import Foundation

struct TheHighPriestessCard: TarotCard {
    var name: String = "The High Priestess"
    var arcana: Arcana = .major
    var yesOrNo: String = "Yes"
    var zodiacSign: String = ""
    var numerology: Int = 300
    var time: String = ""
    var meanings: Meanings = (positive: [
        "balance",
        "consent with intuition",
        "emotions",
        "femininity",
        "inner peace",
        "intuition",
        "mother",
        "mystery",
        "no action",
        "peace",
        "sensitivity",
        "spirituality",
        "wisdom",
        "woman"
    ], negative: [
        "complexes",
        "fear",
        "hypersensitivity",
        "mental issues",
        "suffering",
        "worrying about the opinion of others"
    ])
    var id: Int = 2
}
