//
//  ContentView.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 14/10/2022.
//

import SwiftUI
import TaroterSDK

struct CardsView: View {
    @ObservedObject var viewModel: CardsViewModel

    var body: some View {
        ZStack {
            BackgroundOverlay()

            VStack(spacing: 14) {
                HomeViewProfileHeader()

                Picker("", selection: $viewModel.selectedArcanaSection) {
                    ForEach(Arcana.sortedAllCases, id: \.name) { section in
                        Text(section.name)
                            .tag(section)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.vertical, 8)

                CardsGrid()
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding([.horizontal, .top])
        }
    }
}
