//
//  UINavigationController+UIGestureRecognizerDelegate.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 20/01/2023.
//

import UIKit

/// This extension enables dismissing the SwiftUI View with swipe gesture
/// when the `.navigationBarBackButtonHidden()` modifier is applied.
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
