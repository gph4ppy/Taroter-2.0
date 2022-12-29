//
//  TarotCard.swift
//  TaroterSDK
//
//  Created by Jakub Dąbrowski on 06/11/2022.
//

import Foundation

public typealias Meanings = (positive: [String], negative: [String])

public protocol TarotCard {
    var name: String { get }
    var arcana: Arcana { get }
    var yesOrNo: String { get }
    var zodiacSign: String { get }
    var numerology: Int { get }
    var time: String { get }
    var meanings: Meanings { get }
    var id: Int { get }
}
