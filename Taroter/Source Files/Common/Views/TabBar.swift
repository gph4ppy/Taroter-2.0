//
//  TabBar.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 05/02/2023.
//

import SwiftUI

struct TabBar: View {
    enum Items: CaseIterable {
        case cards
        case scanner
        case spreads
        case settings

        var title: String {
            switch self {
            case .cards: return "Cards"
            case .scanner: return "Scanner"
            case .spreads: return "Spreads"
            case .settings: return "Settings"
            }
        }

        var imageName: String {
            switch self {
            case .cards: return "rectangle.portrait"
            case .scanner: return "camera"
            case .spreads: return "rectangle.grid.3x2"
            case .settings: return "gearshape.fill"
            }
        }

        @MainActor @ViewBuilder var destination: some View {
            switch self {
            case .cards: CardsView(viewModel: CardsViewModel())
            case .scanner: Text("Scanner")
            case .spreads: Text("Spreads")
            case .settings: Text("Settings")
            }
        }
    }

    @Binding var selectedTab: Items
    @State private var indicatorPosition: CGPoint = .zero
    private let cornerRadius: CGFloat = 30
    private let offset: CGFloat = 38
    private let indicatorSize: CGFloat = 80

    var body: some View {
        ZStack(alignment: .bottom) {
            // Indicator
            Circle()
                .fill(TRColor.neonSangrina)
                .frame(maxHeight: indicatorSize)
                .position(
                    x: indicatorPosition.x + indicatorSize / 2,
                    y: indicatorPosition.y - (indicatorSize / 4 - 2)
                )

            // TabBar
            MaterialView(.systemThinMaterialDark)
                .frame(maxHeight: 100)
                .cornerRadius(cornerRadius, corners: [.topLeft, .topRight])
                .offset(y: offset)
                .overlay(content: createTabBarStroke)
                .padding(.horizontal, -2)
                .overlay(content: createTabBarItems)
        }
    }

    private func createTabBarItems() -> some View {
        HStack {
            ForEach(Items.allCases, id: \.title) { item in
                TabBarButton(
                    item: item,
                    selectedTab: $selectedTab,
                    indicatorPosition: $indicatorPosition
                )
            }
        }
        .offset(y: 24)
    }

    @ViewBuilder private func createTabBarStroke() -> some View {
        let colors: [Color] = [.white.opacity(0.3), .clear]
        let gradient = LinearGradient(colors: colors, startPoint: .leading, endPoint: .trailing)

        RoundedCorner(radius: cornerRadius, corners: [.topLeft, .topRight])
            .stroke(gradient, lineWidth: 1)
            .offset(y: offset)
    }
}
