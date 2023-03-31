//
//  SettingsView.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 28/03/2023.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel

    var body: some View {
        ZStack {
            BackgroundOverlay()

            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    AvatarView(imageData: viewModel.userManager.avatar)
                        .frame(width: 130, height: 130)

                    Text("Jakub")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()

                    Spacer().frame(height: 10)

                    Section {
                        Button {
                            viewModel.showingImagePicker = true
                        } label: {
                            Text("Change Avatar")
                        }

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
        .sheet(isPresented: $viewModel.showingImagePicker) {
            ImagePicker(selectedImageData: $viewModel.userManager.avatar)
        }
    }
}

struct AvatarView: View {
    let imageData: Data?

    var body: some View {
        Group {
            if let imageData, let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
            } else {
                Image(systemName: "person.circle")
                    .renderingMode(.template)
                    .resizable()
                    .foregroundColor(.white)
                    .scaledToFit()
            }
        }
        .clipShape(Circle())
        .overlay {
            Circle().stroke(TRColor.snow, lineWidth: 3)
        }
    }
}
