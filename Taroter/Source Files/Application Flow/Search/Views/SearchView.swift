//
//  SearchView.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 20/01/2023.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel

    var body: some View {
        VStack {
            switch (viewModel.searchResults.isEmpty, viewModel.searchText.isEmpty) {
            case (true, true):
                Text("Looking for cards? Search them with name, zodiac sign, time or keyword.")
                    .multilineTextAlignment(.center)
                    .foregroundColor(TRColor.snow)
                    .font(.system(size: 16))
            case (true, false):
                Text("Couldn't find a card with ") +
                Text("\"\(viewModel.searchText)\" ").bold() +
                Text("in its data. Please, try again with different search data.")
            default:
                CardsGrid(cards: viewModel.searchResults)
            }
        }
        .multilineTextAlignment(.center)
        .foregroundColor(TRColor.snow)
        .font(.system(size: 16))
        .padding(16)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack(spacing: 6) {
                    Image(systemName: "chevron.left")
                    Image(systemName: "magnifyingglass")
                    TextField("Search...", text: $viewModel.searchText)
                        .autocorrectionDisabled()
                        .submitLabel(.done)
                }
            }
        }
        .onChange(of: viewModel.searchText) { _ in viewModel.search() }
        // ↓ Workaround, as this view doesn't have background when pushed by the NavigationView.
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(TRColor.blackPearl)
    }
}
