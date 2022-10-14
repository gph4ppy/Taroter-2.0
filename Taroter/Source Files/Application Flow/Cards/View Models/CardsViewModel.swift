//
//  CardsViewModel.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 15/10/2022.
//

import Foundation

final class CardsViewModel: ObservableObject {
    @Published var selectedArcanaSection: CardsView.ArcanasSections = .all
}
