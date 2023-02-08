//
//  ScannerViewController.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 08/02/2023.
//

import UIKit

final class ScannerViewController: UIViewController {
    let viewModel: ScannerViewModel

    init(viewModel: ScannerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.checkCameraPermissions()
        viewModel.sessionQueue.async { [weak self] in
            guard let self, self.viewModel.cameraPermissionGranted else { return }
            self.startSession()
        }
    }

    private func startSession() {
        viewModel.setupCaptureSession { [weak self] previewLayer in
            DispatchQueue.main.async {
                guard let self, let frame = self.view.window?.frame else { return }
                previewLayer.frame = frame
                self.view.layer.addSublayer(previewLayer)
            }

            self?.viewModel.captureSession.startRunning()
            DispatchQueue.main.async {
                self?.viewModel.isLoading = false
            }
        }
    }
}
