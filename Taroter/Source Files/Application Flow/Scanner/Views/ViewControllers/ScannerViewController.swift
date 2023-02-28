//
//  ScannerViewController.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 08/02/2023.
//

import UIKit
import AVFoundation
import Vision

final class ScannerViewController: UIViewController {
    let viewModel: ScannerViewModel
    private let thresholdProvider = ThresholdProvider()
    private var screenRect: CGRect!

    init(viewModel: ScannerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.changeLoadingState(to: true)
        viewModel.checkCameraPermissions()
        viewModel.sessionQueue.async { [weak self] in
            guard let self, self.viewModel.cameraPermissionGranted else { return }
            self.setupSession()
            self.setupLayers()
            self.viewModel.setupDetector(completion: self.detectionDidComplete)
            self.viewModel.captureSession.startRunning()
            self.viewModel.changeLoadingState(to: false)
        }
    }

    func setupSession() {
        guard
            let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back),
            let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice),
            viewModel.captureSession.canAddInput(videoDeviceInput)
        else { return }

        viewModel.captureSession.beginConfiguration()
        viewModel.captureSession.sessionPreset = .hd4K3840x2160
        viewModel.captureSession.addInput(videoDeviceInput)
        viewModel.captureSession.commitConfiguration()

        screenRect = UIScreen.main.bounds

        viewModel.previewLayer = AVCaptureVideoPreviewLayer(session: viewModel.captureSession)
        viewModel.previewLayer.frame = CGRect(
            x: 0,
            y: 0,
            width: screenRect.size.width,
            height: screenRect.size.height
        )
        viewModel.previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        viewModel.previewLayer.connection?.videoOrientation = .portrait

        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.view.layer.addSublayer(self.viewModel.previewLayer)
        }

        // Detector
        viewModel.videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "sampleBufferQueue"))
        viewModel.videoOutput.connection(with: .video)?.videoOrientation = .portrait
        viewModel.captureSession.addOutput(viewModel.videoOutput)
    }

    func setupLayers() {
        viewModel.detectionLayer = CALayer()
        viewModel.detectionLayer.frame = CGRect(
            x: 0,
            y: 0,
            width: screenRect.size.width,
            height: screenRect.size.height
        )
        self.view.layer.addSublayer(viewModel.detectionLayer)
    }
}

extension ScannerViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(
        _ output: AVCaptureOutput,
        didOutput sampleBuffer: CMSampleBuffer,
        from connection: AVCaptureConnection
    ) {
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        let imageRequestHandler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer)

        do {
            try imageRequestHandler.perform(viewModel.requests)
        } catch {
            logPrint("[Scanner] didOutput with error: \(error.localizedDescription)")
        }
    }

    func detectionDidComplete(request: VNRequest, error: Error?) {
        DispatchQueue.main.async { [weak self] in
            guard let self, let results = request.results, error == nil else { return }
            // TODO: - Add values from settings
            self.viewModel.visionModel?.featureProvider = self.thresholdProvider
            self.extractDetections(results)
        }
    }

    func extractDetections(_ results: [VNObservation]) {
        viewModel.detectionLayer.sublayers = nil

        for observation in results {
            guard
                let objectObservation = observation as? VNRecognizedObjectObservation,
                let topLabelObservation = objectObservation.labels.first
            else { continue }

            let objectBounds = VNImageRectForNormalizedRect(
                objectObservation.boundingBox,
                Int(screenRect.size.width),
                Int(screenRect.size.height)
            )

            let transformedBounds = CGRect(
                x: objectBounds.minX,
                y: screenRect.size.height - objectBounds.maxY,
                width: objectBounds.maxX - objectBounds.minX,
                height: objectBounds.maxY - objectBounds.minY
            )

            let boxLayer = self.drawBoundingBox(transformedBounds)
            let textLayer = self.createTextSubLayer(
                bounds: transformedBounds,
                identifier: topLabelObservation.identifier
            )

            boxLayer.addSublayer(textLayer)
            viewModel.detectionLayer.addSublayer(boxLayer)
        }
    }

    func drawBoundingBox(_ bounds: CGRect) -> CALayer {
        let boxLayer = CALayer()
        boxLayer.frame = bounds
        boxLayer.borderWidth = 4.0
        boxLayer.borderColor = UIColor(TRColor.sangrina).cgColor
        boxLayer.cornerRadius = 12
        return boxLayer
    }

    func createTextSubLayer(bounds: CGRect, identifier: String) -> CALayer {
        let background = CALayer()
        background.backgroundColor = UIColor(TRColor.sangrina).cgColor
        background.frame = CGRect(x: 0, y: 0, width: bounds.width, height: 20)

        let textLayer = CATextLayer()
        textLayer.fontSize = 16
        textLayer.font = UIFont.boldSystemFont(ofSize: 16)
        textLayer.frame = CGRect(x: 8, y: 4, width: bounds.width - 8, height: background.frame.height - 4)
        textLayer.string = "\(identifier)"

        background.addSublayer(textLayer)
        return background
    }
}
