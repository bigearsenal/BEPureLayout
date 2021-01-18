//
//  UIStackView+PureLayout.swift
//  BEPureLayout
//
//  Created by Chung Tran on 5/25/20.
//

import Foundation

public protocol BEStackViewElement {}
public extension BEStackViewElement {
    static var spacing: (CGFloat) -> BEStackViewSpacing {
        return {BEStackViewSpacing($0)}
    }
}
extension UIView: BEStackViewElement {}
extension BEStackViewSpacing: BEStackViewElement {}
extension Array: BEStackViewElement where Element: BEStackViewElement {}

public typealias BEStackViewSpacing = CGFloat

public extension UIStackView {
    convenience init(
        axis: NSLayoutConstraint.Axis,
        spacing: CGFloat? = nil,
        alignment: UIStackView.Alignment = .center,
        distribution: UIStackView.Distribution = .fill,
        arrangedSubviews: [BEStackViewElement]? = nil
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
    
    @available(*, deprecated, message: "use insertArrangedSubviewsWithCustomSpacing instead")
    func insertArrangedSubviews(_ subviews: [UIView], at index: Int, withCustomSpacings spacings: [CGFloat] = [])
    {
        var index = index
        subviews.forEach {insertArrangedSubview($0, at: index);index += 1}
        spacings.enumerated().forEach {setCustomSpacing($1, after: subviews[$0])}
    }
    
    func addArrangedSubviews(_ collection: [BEStackViewElement]) {
        for (index, element) in collection.enumerated() {
            if let view = element as? UIView {
                addArrangedSubview(view)
            }
            
            if let spacing = element as? CGFloat {
                let lastView = collection[index - 1] as! UIView
                setCustomSpacing(spacing, after: lastView)
            }
            
            if let array = element as? [BEStackViewElement] {
                addArrangedSubviews(array)
            }
        }
    }
    
    func insertArrangedSubviewsWithCustomSpacing(_ collection: [BEStackViewElement], at index: inout Int)
    {
        for (i, element) in collection.enumerated() {
            if let view = element as? UIView {
                insertArrangedSubview(view, at: index)
                index += 1
            }
            
            if let spacing = element as? CGFloat {
                let lastView = collection[i - 1] as! UIView
                setCustomSpacing(spacing, after: lastView)
            }
            
            if let array = element as? [BEStackViewElement] {
                insertArrangedSubviewsWithCustomSpacing(array, at: &index)
            }
        }
    }
    
    @discardableResult
    func with(spacing: CGFloat? = nil, alignment: UIStackView.Alignment? = nil, distribution: UIStackView.Distribution? = nil) -> UIStackView
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
    
    func stretchArrangedSubviews(_ arrangedSubviews: [UIView]) {
        arrangedSubviews.forEach { view in
            if axis == .vertical {
                view.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
            } else {
                view.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
            }
        }
    }
}
