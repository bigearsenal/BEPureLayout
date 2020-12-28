//
//  UIStackView+PureLayout.swift
//  BEPureLayout
//
//  Created by Chung Tran on 5/25/20.
//

import Foundation

public protocol BEStackViewElement {}
extension UIView: BEStackViewElement {}
extension CGFloat: BEStackViewElement {}

public extension UIStackView {
    convenience init(
        axis: NSLayoutConstraint.Axis,
        spacing: CGFloat? = nil,
        alignment: UIStackView.Alignment = .center,
        distribution: UIStackView.Distribution = .fill,
        arrangedSubviews: [UIView]? = nil,
        customSpacing: [CGFloat]? = nil
    ) {
        self.init(forAutoLayout: ())
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
        
        if let subviews = arrangedSubviews {
            addArrangedSubviews(subviews, withCustomSpacings: customSpacing ?? [])
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
    
    public func addArrangedSubviewsWithCustomSpacing(_ collection: [BEStackViewElement]) {
        for (index, element) in collection.enumerated() {
            if let view = element as? UIView {
                addArrangedSubview(view)
            }
            
            if let spacing = element as? CGFloat {
                let lastView = collection[index - 1] as! UIView
                setCustomSpacing(spacing, after: lastView)
            }
        }
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
