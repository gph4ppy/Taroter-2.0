//
//  NavigationCoordinatorView.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 07/02/2023.
//

import SwiftUI

struct NavigationCoordinatorView: View {
    @State private var selectedTab: TabBar.Items = .cards
    @StateObject private var cardsViewModel: CardsViewModel = CardsViewModel()
    @StateObject private var settingsViewModel: SettingsViewModel = SettingsViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                TRColor.blackPearl.ignoresSafeArea()
                switch selectedTab {
                case .cards:
                    CardsView(viewModel: cardsViewModel)
                case .scanner:
                    ScannerView()
                case .spreads:
                    Text("Spreads").font(.largeTitle)
                case .settings:
                    SettingsView(viewModel: settingsViewModel)
                }
                TabBar(selectedTab: $selectedTab)
            }
        }
    }
}
