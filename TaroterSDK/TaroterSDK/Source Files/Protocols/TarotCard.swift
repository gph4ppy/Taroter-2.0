//
//  TarotCard.swift
//  TaroterSDK
//
//  Created by Jakub Dąbrowski on 06/11/2022.
//

import Foundation

public protocol TarotCard {
    var name: String { get }
    var arcana: Arcana { get }
    var yesOrNo: String { get }
    var zodiacSign: String { get }
    var numerology: Int { get }
    var time: String { get }
    var meanings: [String] { get }
    var id: Int { get }
}
