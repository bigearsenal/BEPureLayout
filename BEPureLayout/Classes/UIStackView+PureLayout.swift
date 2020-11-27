//
//  UIStackView+PureLayout.swift
//  BEPureLayout
//
//  Created by Chung Tran on 5/25/20.
//

import Foundation

public extension UIStackView {
    convenience init(
        axis: NSLayoutConstraint.Axis,
        spacing: CGFloat? = nil,
        alignment: UIStackView.Alignment = .center,
        distribution: UIStackView.Distribution = .fill,
        arrangedSubviews: [UIView]? = nil
    ) {
        self.init(forAutoLayout: ())
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
        
        if let subviews = arrangedSubviews {
            addArrangedSubviews(subviews)
        }
        
        if let spacing = spacing {
            self.spacing = spacing
        }
    }
    
    public func addArrangedSubviews(_ subviews: [UIView]) {
        subviews.forEach {addArrangedSubview($0)}
    }
    
    @discardableResult
    public func with(spacing: CGFloat? = nil, alignment: UIStackView.Alignment? = nil, distribution: UIStackView.Distribution? = nil) -> UIStackView
    {
        if let spacing = spacing {
            self.spacing = spacing
        }
        if let alignment = alignment {
            self.alignment = alignment
        }
        if let distribution = distribution {
            self.distribution = distribution
        }
        return self
    }
}
