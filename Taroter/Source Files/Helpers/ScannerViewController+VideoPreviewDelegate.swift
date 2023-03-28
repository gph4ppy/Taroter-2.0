//
//  ScannerViewController+VideoPreviewDelegate.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 14/03/2023.
//

import Vision

extension ScannerViewController: VideoPreviewDelegate {
    func videoCapture(
        _ capture: VideoPreview,
        didCaptureVideoFrame pixelBuffer: CVPixelBuffer?,
        timestamp: CMTime
    ) {
        viewModel.predict(using: pixelBuffer)
    }
}
