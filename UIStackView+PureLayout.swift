//
//  UIStackView+PureLayout.swift
//  BEPureLayout
//
//  Created by Chung Tran on 5/25/20.
//

import Foundation

@available(iOS 9.0, *)
public extension UIStackView {
    convenience init(
        axis: NSLayoutConstraint.Axis,
        spacing: CGFloat? = nil,
        alignment: UIStackView.Alignment = .center,
        distribution: UIStackView.Distribution = .fill
    ) {
        self.init(forAutoLayout: ())
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
        if let spacing = spacing {
            self.spacing = spacing
        }
    }
}
