//
//  ContentView.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 14/10/2022.
//

import SwiftUI

struct CardsView: View {
    @ObservedObject var viewModel: CardsViewModel

    enum ArcanasSections: Int, CaseIterable {
        case major = 1
        case minor = 3
        case all = 2

        var name: String {
            switch self {
            case .major:
                return "Major Arcana"
            case .minor:
                return "Minor Arcana"
            case .all:
                return "All Cards"
            }
        }

        static var sortedAllCases: [ArcanasSections] {
            allCases.sorted(by: { $0.rawValue < $1.rawValue })
        }
    }

    var body: some View {
        ZStack {
            BackgroundOverlay()

            VStack(spacing: 14) {
                HomeViewProfileHeader()

                Picker("", selection: $viewModel.selectedArcanaSection) {
                    ForEach(ArcanasSections.sortedAllCases, id: \.name) { section in
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

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView(viewModel: CardsViewModel())
    }
}
