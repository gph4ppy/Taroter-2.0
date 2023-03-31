//
//  CardsViewModel.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 15/10/2022.
//

import TaroterSDK

final class CardsViewModel: ObservableObject {
    @Published var selectedArcanaSection: Arcana = .all
}
