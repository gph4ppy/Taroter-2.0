//
//  ScannerView.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 08/02/2023.
//

import SwiftUI

struct ScannerView: View {
    @StateObject private var viewModel: ScannerViewModel = ScannerViewModel()

    var body: some View {
        ScannerViewWrapper(viewModel: viewModel)
            .ignoresSafeArea()
            .overlay {
                if viewModel.isLoading {
                    LoadingView()
                }
            }
    }
}

struct ScannerViewWrapper: UIViewControllerRepresentable {
    var viewModel: ScannerViewModel

    func makeUIViewController(context: Context) -> UIViewController {
        ScannerViewController(viewModel: viewModel)
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
