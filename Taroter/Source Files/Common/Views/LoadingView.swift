//
//  LoadingView.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 08/02/2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .scaleEffect(1.8)
            .padding(40)
            .background(MaterialView(.systemChromeMaterialDark))
            .cornerRadius(24)
    }
}
