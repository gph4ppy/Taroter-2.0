//
//  ScannerViewModel.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 08/02/2023.
//

import AVFoundation
import Foundation

@MainActor
final class ScannerViewModel: NSObject, ObservableObject, AVCaptureVideoDataOutputSampleBufferDelegate {
    let captureSession: AVCaptureSession = AVCaptureSession()
    let sessionQueue: DispatchQueue = DispatchQueue(label: "sessionQueue")
    var videoPreviewLayer: AVCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer()
    var videoOutput: AVCaptureVideoDataOutput = AVCaptureVideoDataOutput()
    var cameraPermissionGranted: Bool = false
    @Published var isLoading: Bool = false

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

    func setupCaptureSession(completionHandler: (AVCaptureVideoPreviewLayer) -> Void) {
        guard
            let device = AVCaptureDevice.default(.builtInDualWideCamera, for: .video, position: .back),
            let input = try? AVCaptureDeviceInput(device: device),
            captureSession.canAddInput(input)
        else { return }

        DispatchQueue.main.sync { [weak self] in
            self?.isLoading = true
        }
        captureSession.addInput(input)

        // Preview Layer
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        videoPreviewLayer.connection?.videoOrientation = .portrait

        // Detector
        videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "sampleBufferQueue"))
        captureSession.addOutput(videoOutput)
        videoOutput.connection(with: .video)?.videoOrientation = .portrait

        completionHandler(self.videoPreviewLayer)
    }

    private func requestCameraPermissions() {
        sessionQueue.suspend()
        AVCaptureDevice.requestAccess(for: .video) { [weak self] accessGranted in
            guard let self else { return }
            self.cameraPermissionGranted = accessGranted
            self.sessionQueue.resume()
        }
    }
}
