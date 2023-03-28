//
//  SettingsView.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 28/03/2023.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            BackgroundOverlay()

            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    Image(systemName: "person.circle")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 130, height: 130)
                        .foregroundColor(.white)

                    Text("Jakub")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()

                    Spacer().frame(height: 10)

                    Section {
                        Text("Change Avatar")
                        Text("Change Name")
                        Text("Birthday")
                        Text("Birthday Cards")
                    } header: {
                        Text("User").bold()
                    }
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)

                    Spacer().frame(height: 10)

                    Section {
                        HStack {
                            Text("Theme")
                            Spacer()
                            Text("Coming soon")
                        }
                        HStack {
                            Text("Reset Application")
                            Spacer()
                            Text("Coming soon")
                        }
                    } header: {
                        Text("Application").bold()
                    }
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.top, 30)
                .padding(.horizontal, 16)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
