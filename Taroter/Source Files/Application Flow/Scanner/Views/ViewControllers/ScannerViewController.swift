//
//  ScannerViewController.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 08/02/2023.
//

import UIKit
import Vision

// TODO: - Change isLoading
final class ScannerViewController: UIViewController {
    let viewModel: ScannerViewModel
    private var videoPreview: UIView!
    private var boxesView: DrawingBoundingBoxView!

    init(viewModel: ScannerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.videoCapture.delegate = self
        viewModel.loadModel(completion: visionRequestDidComplete)
        viewModel.setupCamera(completion: cameraSetupDidComplete)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.videoCapture.start()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewModel.resizePreviewLayer(to: videoPreview.bounds)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.videoCapture.stop()
    }

    private func cameraSetupDidComplete() {
        addPreviewView()
        addBoxesView()
        addPreviewSublayer()
        viewModel.videoCapture.start()
    }

    private func addPreviewView() {
        videoPreview = UIView(frame: view.frame)
        view.addSubview(videoPreview)
    }

    private func addBoxesView() {
        boxesView = DrawingBoundingBoxView(frame: view.frame)
        view.addSubview(boxesView)
    }

    private func addPreviewSublayer() {
        guard let previewLayer = viewModel.videoCapture.previewLayer else { return }
        viewModel.resizePreviewLayer(to: videoPreview.bounds)
        videoPreview.layer.addSublayer(previewLayer)
    }

    private func visionRequestDidComplete(request: VNRequest, error: Error?) {
        guard let predictions = request.results as? [VNRecognizedObjectObservation] else {
            viewModel.isInferencing = false
            viewModel.semaphore.signal()
            return
        }

        var filteredPredictions: [VNRecognizedObjectObservation] = []
        for prediction in predictions {
            guard !filteredPredictions.contains(where: { $0.label == prediction.label }) else { continue }
            filteredPredictions.append(prediction)
        }

        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.boxesView.predictedObjects = filteredPredictions
            self.viewModel.isInferencing = false
            self.viewModel.semaphore.signal()
        }
    }
}
