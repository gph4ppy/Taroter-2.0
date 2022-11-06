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
    var meanings: [String] = []
    var id: Int = 1
}
