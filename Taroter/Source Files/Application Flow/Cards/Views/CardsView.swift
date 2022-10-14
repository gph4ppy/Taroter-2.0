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
            // Background Overlay
            RoundedRectangle(cornerRadius: 50)
                .fill(TRColor.tyrianPurple)
                .frame(height: 250)
                .frame(maxHeight: .infinity, alignment: .top)
                .offset(y: -110)
                .blur(radius: 60)

            VStack(spacing: 14) {
                // Profile Header
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

                // Cards
                Text("Major Arcana")
                    .fontWeight(.bold)
                    .font(.system(size: 24))
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical)

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
