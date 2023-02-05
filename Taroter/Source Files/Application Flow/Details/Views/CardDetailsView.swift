//
//  CardDetailsView.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 22/01/2023.
//

import SwiftUI

struct CardDetailsView: View {
    @ObservedObject var viewModel: CardDetailsViewModel
    @Environment(\.dismiss) private var dismissAction

    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                Text(viewModel.card.data.name)
                    .font(.system(size: 36, weight: .semibold))

                Text(viewModel.card.data.arcana.name)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.gray)

                HStack(spacing: 6) {
                    createTarotCardPreview()
                    Spacer()
                    createTarotCardPreview()
                        .rotationEffect(.degrees(180))
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 20)
            }
            .padding(20)

        }
        .foregroundColor(TRColor.snow)
        .font(.system(size: 16))
        .navigationBarBackButtonHidden()
        .toolbar(content: buildToolbar)
        // ↓ Workaround, as this view doesn't have background when pushed by the NavigationView.
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(TRColor.blackPearl)
//        .ignoresSafeArea()
    }

    /// This method builds a SearchView toolbar content.
    @ToolbarContentBuilder private func buildToolbar() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button(action: dismissAction.callAsFunction) {
                Image(systemName: "chevron.left")
                    .shadow(radius: 1)
            }
            .buttonStyle(.plain)
        }
    }

    private func createTarotCardPreview() -> some View {
        Image(viewModel.card.data.name)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(24)
    }
}

struct DetailsPreview: PreviewProvider {
    static var previews: some View {
        CardDetailsView(viewModel: .init(card: .fool))
    }
}
