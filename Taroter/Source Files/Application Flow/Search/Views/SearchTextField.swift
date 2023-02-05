//
//  SearchTextField.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 22/01/2023.
//

import SwiftUI

struct SearchTextField: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            TextField("Search...", text: $searchText)
                .autocorrectionDisabled()
                .submitLabel(.done)
                .foregroundColor(TRColor.snow)
                .frame(maxWidth: .infinity)

            Spacer()

            if !searchText.isEmpty {
                Button {
                    searchText = ""
                } label: {
                    Image(systemName: "xmark")
                        .imageScale(.small)
                        .padding(4)
                        .background(.gray)
                        .clipShape(Circle())
                        .foregroundColor(.black)
                }
            }
        }
    }
}
