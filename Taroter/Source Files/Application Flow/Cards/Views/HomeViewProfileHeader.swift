//
//  HomeViewProfileHeader.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 15/10/2022.
//

import SwiftUI

/// A view used to display user data and the search button on the Home Screen.
struct HomeViewProfileHeader: View {
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: "person.circle")
                .font(.system(size: 60))

            Text("Hello, Jakub!")
                .fontWeight(.semibold)

            Spacer()

            Image(systemName: "magnifyingglass")
        }
        .font(.system(size: 24))
        .foregroundColor(TRColor.snow)
    }
}
