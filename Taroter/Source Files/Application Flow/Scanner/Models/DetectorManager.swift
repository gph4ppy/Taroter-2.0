//
//  DetectorManager.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 25/02/2023.
//

import Vision

struct DetectorManager {
    static func createDetectorModel() -> VNCoreMLModel {
        let configuration = MLModelConfiguration()
        let classifier = try? TaroterDetector(configuration: configuration)
        guard let model = classifier?.model, let visionModel = try? VNCoreMLModel(for: model) else {
            fatalError("[ML] Failed to get the Vision model instance")
        }
        return visionModel
    }
}
