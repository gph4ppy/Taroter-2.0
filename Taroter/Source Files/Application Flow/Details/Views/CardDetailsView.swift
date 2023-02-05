//
//  CardDetailsView.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 22/01/2023.
//

import SwiftUI
import TaroterSDK

struct CardDetailsView: View {
    @ObservedObject var viewModel: CardDetailsViewModel
    @Environment(\.dismiss) private var dismissAction

    enum InformationRows: CaseIterable {
        case yesOrNo
        case zodiacSign
        case numerology
        case time

        var title: String {
            switch self {
            case .yesOrNo:
                return "Yes or No?"
            case .zodiacSign:
                return "Zodiac Sign"
            case .numerology:
                return "Numerology"
            case .time:
                return "Time"
            }
        }

        func data(for card: TarotCards) -> String {
            switch self {
            case .yesOrNo:
                return card.data.yesOrNo
            case .zodiacSign:
                return card.data.zodiacSign
            case .numerology:
                return card.data.numerology.asString
            case .time:
                return card.data.time
            }
        }
    }

    enum KeywordsColumns: CaseIterable {
        case upright
        case reversed

        var title: String {
            switch self {
            case .upright:
                return "Upright"
            case .reversed:
                return "Reversed"
            }
        }

        var alignment: Alignment {
            switch self {
            case .upright:
                return .topLeading
            case .reversed:
                return .topTrailing
            }
        }

        var horizontalAlignment: HorizontalAlignment {
            switch self {
            case .upright:
                return .leading
            case .reversed:
                return .trailing
            }
        }

        var textAlignment: TextAlignment {
            switch self {
            case .upright:
                return .leading
            case .reversed:
                return .trailing
            }
        }

        func data(for card: TarotCards) -> [String] {
            switch self {
            case .upright:
                return card.data.meanings.positive
            case .reversed:
                return card.data.meanings.negative
            }
        }
    }

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
                .padding(.vertical, 20)

                ForEach(InformationRows.allCases, id: \.self) { row in
                    createInformationRow(title: row.title, data: row.data(for: viewModel.card))
                        .padding(.bottom, 8)
                }

                HStack {
                    ForEach(KeywordsColumns.allCases, id: \.self) { column in
                        createKeywordsColumn(column: column)
                    }
                }
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

    private func createInformationRow(title: String, data: String) -> some View {
        HStack {
            Text(title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
            Spacer()
            Text(data)
                .multilineTextAlignment(.trailing)
        }
        .font(.system(size: 16))
    }

    private func createKeywordsColumn(column: KeywordsColumns) -> some View {
        VStack(alignment: column.horizontalAlignment, spacing: 10) {
            Text(column.title).fontWeight(.semibold)
            ForEach(column.data(for: viewModel.card), id: \.self) { keyword in
                Text(keyword)
                    .multilineTextAlignment(column.textAlignment)
            }
        }
        .font(.system(size: 16))
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: column.alignment)
    }
}

struct DetailsPreview: PreviewProvider {
    static var previews: some View {
        CardDetailsView(viewModel: .init(card: .fool))
    }
}
