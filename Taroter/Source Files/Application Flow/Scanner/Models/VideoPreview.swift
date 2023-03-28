//
//  VideoPreview.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 14/03/2023.
//

import AVFoundation

final class VideoPreview: NSObject {
    var fps: Int32 = 15
    var lastTimestamp: CMTime = CMTime()
    var previewLayer: AVCaptureVideoPreviewLayer?
    private let captureSession: AVCaptureSession = AVCaptureSession()
    private let videoOutput: AVCaptureVideoDataOutput = AVCaptureVideoDataOutput()
    private let queue: DispatchQueue = DispatchQueue(label: "CameraQueue")
    weak var delegate: VideoPreviewDelegate?

    func setup(sessionPreset: AVCaptureSession.Preset, completion: @escaping () -> Void) {
        captureSession.beginConfiguration()
        captureSession.sessionPreset = sessionPreset

        guard let captureDevice = AVCaptureDevice.default(
            .builtInWideAngleCamera,
            for: .video,
            position: .back
        ) else {
            logPrint("[Preview] Couldn't find any available device or input")
            return
        }

        guard let videoInput = try? AVCaptureDeviceInput(device: captureDevice) else {
            logPrint("[Preview] Couldn't create AVCaptureDeviceInput instance")
            return
        }

        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        }

        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        previewLayer.connection?.videoOrientation = .portrait
        self.previewLayer = previewLayer

        let settings: [String: Any] = [
            kCVPixelBufferPixelFormatTypeKey as String: NSNumber(value: kCVPixelFormatType_32BGRA)
        ]

        videoOutput.videoSettings = settings
        videoOutput.alwaysDiscardsLateVideoFrames = true
        videoOutput.setSampleBufferDelegate(self, queue: queue)

        if captureSession.canAddOutput(videoOutput) {
            captureSession.addOutput(videoOutput)
        }

        videoOutput.connection(with: AVMediaType.video)?.videoOrientation = .portrait
        captureSession.commitConfiguration()
        completion()
    }

    func start() {
        guard !captureSession.isRunning else { return }
        DispatchQueue.global(qos: .background).async(execute: captureSession.startRunning)
    }

    func stop() {
        guard captureSession.isRunning else { return }
        DispatchQueue.global(qos: .background).async(execute: captureSession.stopRunning)
    }
}
