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
    
    // Remve this method
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
    
    convenience init(
        axis: NSLayoutConstraint.Axis,
        spacing: CGFloat? = nil,
        alignment: UIStackView.Alignment = .center,
        distribution: UIStackView.Distribution = .fill,
        @BEViewBuilder builder: Builder
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

extension UIStackView {
    public func setIsHidden(_ isHidden: Bool, on view: UIView, animated: Bool) {
        if !animated {
            view.isHidden = isHidden
            view.alpha = 1
        } else {
            // put all another views into its position first
            layoutIfNeeded()
            
            // set oldValue
            let oldHiddenValue = view.isHidden
            view.isHidden = oldHiddenValue
            view.alpha = oldHiddenValue ? 0: 1
            
            UIView.animate(
                withDuration: 0.3,
                delay: 0.0,
                usingSpringWithDamping: 0.9,
                initialSpringVelocity: 1,
                options: [],
                animations: {
                    view.alpha = isHidden ? 0: 1
                    view.isHidden = isHidden
                    self.layoutIfNeeded()
                }
            )
        }
    }
    
    public func make(viewsHidden: [UIView] = [], viewsVisible: [UIView] = [], animated: Bool) {
        let viewsHidden = viewsHidden.filter({ $0.superview === self })
        let viewsVisible = viewsVisible.filter({ $0.superview === self })

        let blockToSetVisibility: ([UIView], _ hidden: Bool) -> Void = { views, hidden in
            views.forEach({ $0.isHidden = hidden })
        }

        // need for smooth animation
        let blockToSetAlphaForSubviewsOf: ([UIView], _ alpha: CGFloat) -> Void = { views, alpha in
            views.forEach({ view in
                view.subviews.forEach({ $0.alpha = alpha })
            })
        }

        if !animated {
            blockToSetVisibility(viewsHidden, true)
            blockToSetVisibility(viewsVisible, false)
            blockToSetAlphaForSubviewsOf(viewsHidden, 1)
            blockToSetAlphaForSubviewsOf(viewsVisible, 1)
        } else {
            // update hidden values of all views
            // without that animation doesn't go
            let allViews = viewsHidden + viewsVisible
            self.layer.removeAllAnimations()
            allViews.forEach { view in
                let oldHiddenValue = view.isHidden
                view.layer.removeAllAnimations()
                view.layer.isHidden = oldHiddenValue
            }

            UIView.animate(withDuration: 0.3,
                           delay: 0.0,
                           usingSpringWithDamping: 0.9,
                           initialSpringVelocity: 1,
                           options: [],
                           animations: {

                            blockToSetAlphaForSubviewsOf(viewsVisible, 1)
                            blockToSetAlphaForSubviewsOf(viewsHidden, 0)

                            blockToSetVisibility(viewsHidden, true)
                            blockToSetVisibility(viewsVisible, false)
                            self.layoutIfNeeded()
            },
                           completion: nil)
        }
    }
}
