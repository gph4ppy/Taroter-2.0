//
//  TaroterApp.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 14/10/2022.
//

import SwiftUI

@main
struct TaroterApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationCoordinatorView()
                .navigationViewStyle(.stack)
                .preferredColorScheme(.dark)
        }
    }
}
