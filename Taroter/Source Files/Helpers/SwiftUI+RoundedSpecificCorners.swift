//
//  SwiftUI+RoundedSpecificCorners.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 07/02/2023.
//

import SwiftUI

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

extension View {
    /// A modifier that rounds the specific corners.
    /// - Parameters:
    ///   - radius: a radius of the rounded corners.
    ///   - corners: a corners which are about to be rounded.
    /// - Returns: A view that has rounded specific corners.
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
