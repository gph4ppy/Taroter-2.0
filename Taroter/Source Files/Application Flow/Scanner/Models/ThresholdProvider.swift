//
//  ThresholdProvider.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 28/02/2023.
//

import CoreML

final class ThresholdProvider: MLFeatureProvider {
    static let iouThreshold = 0.8
    static let confidenceThreshold = 0.6

    var values = [
        "iouThreshold": MLFeatureValue(double: iouThreshold),
        "confidenceThreshold": MLFeatureValue(double: confidenceThreshold)
    ]

    var featureNames: Set<String> {
        return Set(values.keys)
    }

    func featureValue(for featureName: String) -> MLFeatureValue? {
        return values[featureName]
    }
}
