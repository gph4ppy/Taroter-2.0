//
//  ScannerViewModel.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 08/02/2023.
//

import AVFoundation
import Foundation
import Vision

@MainActor
final class ScannerViewModel: ObservableObject {
    let videoCapture: VideoPreview = VideoPreview()
    let semaphore: DispatchSemaphore = DispatchSemaphore(value: 1)
    var request: VNCoreMLRequest?
    @Published var isLoading: Bool = false
    @Published var isInferencing: Bool = false

    func loadModel(completion: @escaping (_ request: VNRequest, _ error: Error?) -> Void) {
        let model = DetectorManager.createDetectorModel()
        request = VNCoreMLRequest(model: model, completionHandler: completion)
        request?.imageCropAndScaleOption = .scaleFill
    }

    func setupCamera(completion: @escaping () -> Void) {
        videoCapture.fps = 30
        videoCapture.setup(sessionPreset: .hd1920x1080, completion: completion)
    }

    func resizePreviewLayer(to frame: CGRect) {
        videoCapture.previewLayer?.frame = frame
    }

    func predict(using pixelBuffer: CVPixelBuffer?) {
        DispatchQueue.main.async { [weak self] in
            guard let self, let pixelBuffer, let request = self.request, !self.isInferencing else { return }
            self.isInferencing = true
            self.semaphore.wait()
            self.performRequest(request, with: pixelBuffer)
        }
    }

    private func performRequest(_ request: VNCoreMLRequest, with pixelBuffer: CVPixelBuffer) {
        let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer)
        try? handler.perform([request])
    }
}
