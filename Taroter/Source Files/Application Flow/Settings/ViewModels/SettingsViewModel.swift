//
//  SettingsViewModel.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 31/03/2023.
//

import Foundation

@MainActor
final class SettingsViewModel: ObservableObject {
    @Published var showingImagePicker: Bool = false
    var userManager: UserManager = UserManager()
}
