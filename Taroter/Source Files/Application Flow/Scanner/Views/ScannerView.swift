//
//  ScannerView.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 08/02/2023.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    @StateObject private var viewModel: ScannerViewModel = ScannerViewModel()

    func makeUIViewController(context: Context) -> UIViewController {
        ScannerViewController(viewModel: viewModel)
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
