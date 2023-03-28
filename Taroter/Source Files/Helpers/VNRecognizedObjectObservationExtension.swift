//
//  VNRecognizedObjectObservationExtension.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 14/03/2023.
//

import Vision

extension VNRecognizedObjectObservation {
    var label: String {
        labels.first?.identifier ?? "⚠️"
    }
}
