//
//  BackgroundOverlay.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 15/10/2022.
//

import SwiftUI

struct BackgroundOverlay: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 50)
            .fill(TRColor.tyrianPurple)
            .frame(height: 250)
            .frame(maxHeight: .infinity, alignment: .top)
            .offset(y: -110)
            .blur(radius: 60)
    }
}
