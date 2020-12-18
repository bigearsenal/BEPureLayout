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
    
    public func addArrangedSubviews(_ subviews: [UIView], withCustomSpacings spacings: [CGFloat] = [])
    {
        subviews.forEach {addArrangedSubview($0)}
        spacings.enumerated().forEach {setCustomSpacing($1, after: subviews[$0])}
    }
    
    public func insertArrangedSubviews(_ subviews: [UIView], at index: Int, withCustomSpacings spacings: [CGFloat] = [])
    {
        var index = index
        subviews.forEach {insertArrangedSubview($0, at: index);index += 1}
        spacings.enumerated().forEach {setCustomSpacing($1, after: subviews[$0])}
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
    
    public func stretchArrangedSubviews(_ arrangedSubviews: [UIView]) {
        arrangedSubviews.forEach { view in
            if axis == .vertical {
                view.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
            } else {
                view.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
            }
        }
    }
}
