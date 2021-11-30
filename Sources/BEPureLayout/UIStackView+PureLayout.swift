//
//  UIStackView+PureLayout.swift
//  BEPureLayout
//
//  Created by Chung Tran on 5/25/20.
//

import Foundation

public protocol BEStackViewElement {
    var elements: [BEStackViewElement] {get}
}
public extension BEStackViewElement {
    static func spacer(_ space: CGFloat) -> BEStackViewSpacing {
        return BEStackViewSpacing(space)
    }
}
extension UIView: BEStackViewElement {
    public var elements: [BEStackViewElement] {
        [self]
    }
}
extension BEStackViewSpacing: BEStackViewElement {
    public var elements: [BEStackViewElement] {
        [self]
    }
}
extension Array: BEStackViewElement where Element: BEStackViewElement {
    public var elements: [BEStackViewElement] {
        self
    }
}

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
        
        set(axis: axis, spacing: spacing, alignment: alignment, distribution: distribution)
        
        if let subviews = arrangedSubviews {
            addArrangedSubviews(subviews)
        }
    }
    
    
    
    convenience init(
        axis: NSLayoutConstraint.Axis,
        spacing: CGFloat? = nil,
        alignment: UIStackView.Alignment = .center,
        distribution: UIStackView.Distribution = .fill,
        @BEStackViewBuilder builder: () -> [BEStackViewElement]
    ) {
        self.init(forAutoLayout: ())
        
        set(axis: axis, spacing: spacing, alignment: alignment, distribution: distribution)
        
        addArrangedSubviews(builder: builder)
    }
    
    @available(*, deprecated, message: "use insertArrangedSubviewsWithCustomSpacing instead")
    func insertArrangedSubviews(_ subviews: [UIView], at index: Int, withCustomSpacings spacings: [CGFloat] = [])
    {
        var index = index
        subviews.forEach {insertArrangedSubview($0, at: index);index += 1}
        spacings.enumerated().forEach {setCustomSpacing($1, after: subviews[$0])}
    }
    
    func addArrangedSubviews(_ collection: [BEStackViewElement?]) {
        for (index, element) in collection.enumerated() {
            if let view = element as? UIView {
                addArrangedSubview(view)
            }
            
            if let spacing = element as? CGFloat {
                if index - 1 >= 0,
                   let lastView = collection[index - 1] as? UIView
                {
                    setCustomSpacing(spacing, after: lastView)
                } else {
                    var viewToAdd: UIView
                    switch axis {
                    case .horizontal:
                        viewToAdd = UIView(width: spacing)
                    default:
                        viewToAdd = UIView(height: spacing)
                    }
                    addArrangedSubview(viewToAdd)
                }
            }
            
            if let array = element as? [BEStackViewElement] {
                addArrangedSubviews(array)
            }
        }
    }
    
    func addArrangedSubviews(@BEStackViewBuilder builder: () -> [BEStackViewElement])
    {
        addArrangedSubviews(builder())
    }
    
    func insertArrangedSubviewsWithCustomSpacing(_ collection: [BEStackViewElement?], at index: inout Int)
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
    
    func insertArrangedSubviews(at index: inout Int, @BEStackViewBuilder builder: () -> [BEStackViewElement])
    {
        insertArrangedSubviewsWithCustomSpacing(builder(), at: &index)
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
    
    func set(
        axis: NSLayoutConstraint.Axis,
        spacing: CGFloat? = nil,
        alignment: UIStackView.Alignment = .center,
        distribution: UIStackView.Distribution = .fill
    ) {
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
        
        if let spacing = spacing {
            self.spacing = spacing
        }
    }
}
