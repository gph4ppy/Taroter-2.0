//
//  DrawingBoundingBoxView.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 14/03/2023.
//

import UIKit
import Vision

final class DrawingBoundingBoxView: UIView {
    var predictedObjects: [VNRecognizedObjectObservation] = [] {
        didSet {
            self.drawBoxs(with: predictedObjects)
            self.setNeedsDisplay()
        }
    }

    private static var colors: [String: UIColor] = [:]

    private func labelColor(with label: String) -> UIColor {
        if let color = DrawingBoundingBoxView.colors[label] {
            return color
        } else {
            let color = UIColor(hue: .random(in: 0...1), saturation: 1, brightness: 1, alpha: 0.8)
            DrawingBoundingBoxView.colors[label] = color
            return color
        }
    }

    private func drawBoxs(with predictions: [VNRecognizedObjectObservation]) {
        subviews.forEach { $0.removeFromSuperview() }
        predictions.forEach { createLabelAndBox(prediction: $0) }
    }

    private func createLabelAndBox(prediction: VNRecognizedObjectObservation) {
        let labelString = prediction.label
        let color = labelColor(with: labelString)
        let scale = CGAffineTransform.identity.scaledBy(x: bounds.width, y: bounds.height)
        let transform = CGAffineTransform(scaleX: 1, y: -1).translatedBy(x: 0, y: -1)
        let bgRect = prediction.boundingBox.applying(transform).applying(scale)

        let box = createBox(color: color, frame: bgRect)
        addSubview(box)
        let label = createLabel(text: labelString, color: color, background: bgRect)
        addSubview(label)
    }

    private func createBox(color: UIColor, frame: CGRect) -> UIView {
        let box = UIView(frame: frame)
        box.layer.borderColor = color.cgColor
        box.layer.borderWidth = 3
        return box
    }

    private func createLabel(text: String, color: UIColor, background rect: CGRect) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor.white
        label.backgroundColor = color
        label.sizeToFit()
        label.frame = CGRect(
            x: rect.origin.x,
            y: rect.origin.y - label.frame.height,
            width: label.frame.width,
            height: label.frame.height
        )
        return label
    }
}
