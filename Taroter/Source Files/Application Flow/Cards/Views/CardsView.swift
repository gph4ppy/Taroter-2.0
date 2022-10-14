//
//  ContentView.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 14/10/2022.
//

import SwiftUI

struct CardsView: View {
    var body: some View {
        ZStack {
            BackgroundOverlay()

            VStack(spacing: 14) {
                HomeViewProfileHeader()

                // Cards
                Picker("", selection: .constant("All")) {
                    Text("Major Arcana")
                    Text("All")
                    Text("Minor Arcana")
                }
                .pickerStyle(.segmented)
                .padding(.vertical, 8)

                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 110), spacing: 20, alignment: .top)], spacing: 20) {
                        ForEach(0..<100) { _ in
                            Image("The Fool")
                                .resizable()
                                .scaledToFill()
                                .frame(height: 200)
                                .cornerRadius(24)
                        }
                    }
                }
                .cornerRadius(24)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding([.horizontal, .top])
        }
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView()
    }
}
