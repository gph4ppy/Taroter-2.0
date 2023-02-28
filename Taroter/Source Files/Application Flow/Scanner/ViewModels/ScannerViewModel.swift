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
    let captureSession = AVCaptureSession()
    let sessionQueue = DispatchQueue(label: "sessionQueue")
    @Published var isLoading: Bool = false
    @Published var requests: [VNRequest] = []
    @Published var visionModel: VNCoreMLModel?
    var previewLayer = AVCaptureVideoPreviewLayer()
    var cameraPermissionGranted: Bool = false

    // Detector
    var videoOutput = AVCaptureVideoDataOutput()
    var detectionLayer: CALayer!

    func checkCameraPermissions() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            cameraPermissionGranted = true
        case .notDetermined:
            requestCameraPermissions()
        default:
            cameraPermissionGranted = false
        }
    }

    private func requestCameraPermissions() {
        sessionQueue.suspend()
        AVCaptureDevice.requestAccess(for: .video) { [weak self] accessGranted in
            guard let self else { return }
            self.cameraPermissionGranted = accessGranted
            self.sessionQueue.resume()
        }
    }

    func changeLoadingState(to state: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?.isLoading = state
        }
    }
}

extension ScannerViewModel {
    func setupDetector(completion: @escaping VNRequestCompletionHandler) {
        let manager = DetectorManager()
        let model = manager.createDetectorModel()
        let request = VNCoreMLRequest(model: model, completionHandler: completion)
        request.imageCropAndScaleOption = .scaleFillRotate90CCW
        DispatchQueue.main.async { [weak self] in
            self?.visionModel = model
            self?.requests = [request]
        }
    }
}
