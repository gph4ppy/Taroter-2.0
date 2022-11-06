//
//  CardsGrid.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 06/11/2022.
//

import SwiftUI

struct CardsGrid: View {
    private let cornerRadius: CGFloat = 24
    private let columns: [GridItem] = [
        GridItem(
            .adaptive(minimum: 110),
            spacing: 20,
            alignment: .top
        )
    ]

    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(0..<100) { _ in
                    Image("The Fool")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .overlay(alignment: .bottom) {
                            Color.black.opacity(0.6)
                                .frame(height: 44)

                            Text("The Fool")
                                .fontWeight(.semibold)
                                .font(.system(size: 14))
                                .lineLimit(1)
                        }
                        .cornerRadius(cornerRadius)
                }
            }
        }
        .cornerRadius(cornerRadius)
    }
}
