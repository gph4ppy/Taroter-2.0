//
//  Arcana.swift
//  TaroterSDK
//
//  Created by Jakub Dąbrowski on 06/11/2022.
//

import Foundation

public enum Arcana: Int, CaseIterable {
    case major = 1
    case minor = 3
    case all = 2

    public var name: String {
        switch self {
        case .major:
            return "Major Arcana"
        case .minor:
            return "Minor Arcana"
        case .all:
            return "All Cards"
        }
    }

    public static var sortedAllCases: [Arcana] {
        allCases.sorted(by: { $0.rawValue < $1.rawValue })
    }
}
