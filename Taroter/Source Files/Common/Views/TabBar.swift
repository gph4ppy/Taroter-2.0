//
//  TabBar.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 05/02/2023.
//

import SwiftUI

struct TabBar: View {
    private enum Items: CaseIterable {
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

    private let cornerRadius: CGFloat = 30
    private let offset: CGFloat = 38

    var body: some View {
        ZStack(alignment: .bottom) {
            CardsView(viewModel: .init())

            // TabBar
            MaterialView(.systemThinMaterialDark)
                .frame(maxHeight: 100)
                .cornerRadius(cornerRadius, corners: [.topLeft, .topRight])
                .offset(y: offset)
                .overlay(content: createTabBarStroke)
                .padding(.horizontal, -2)
        }
    }

    @ViewBuilder private func createTabBarStroke() -> some View {
        let colors: [Color] = [.white.opacity(0.3), .clear]
        let gradient = LinearGradient(colors: colors, startPoint: .leading, endPoint: .trailing)

        RoundedRectangle(cornerRadius: cornerRadius)
            .stroke(gradient, lineWidth: 1)
            .offset(y: offset)
    }
}
