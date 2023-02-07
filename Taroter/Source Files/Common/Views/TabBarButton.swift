//
//  TabBarButton.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 07/02/2023.
//

import SwiftUI

struct TabBarButton: View {
    let item: TabBar.Items
    @Binding var selectedTab: TabBar.Items
    @Binding var indicatorPosition: CGPoint
    @State private var itemPosition: CGPoint = .zero

    var body: some View {
        Button {
            withAnimation {
                selectedTab = item
                indicatorPosition = itemPosition
            }
        } label: {
            VStack(spacing: 6) {
                Image(systemName: item.imageName)
                    .font(.headline.weight(.semibold))
                Text(item.title)
                    .font(.caption.weight(.semibold))
            }
            .foregroundStyle(createForegroundStyle())
            .frame(maxWidth: .infinity)
        }
        .background(backgroundReader)
    }

    private var backgroundReader: some View {
        GeometryReader { proxy in
            Color.clear.onAppear {
                let frame = proxy.frame(in: .global)
                indicatorPosition = frame.origin
                itemPosition = frame.origin
                if selectedTab == item {
                    indicatorPosition = frame.origin
                }
            }
        }
    }

    private func createForegroundStyle() -> LinearGradient {
        let selectedColors: [Color] = [TRColor.neonSangrina]
        let unselectedColors: [Color] = [.white.opacity(0.3), .white.opacity(0.7)]
        let gradient: LinearGradient = LinearGradient(
            colors: selectedTab == item ? selectedColors : unselectedColors,
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        return gradient
    }
}
