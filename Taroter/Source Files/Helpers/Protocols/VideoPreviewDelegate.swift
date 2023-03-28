//
//  VideoPreviewDelegate.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 14/03/2023.
//

import Vision

protocol VideoPreviewDelegate: AnyObject {
    func videoCapture(_ capture: VideoPreview, didCaptureVideoFrame: CVPixelBuffer?, timestamp: CMTime)
}
