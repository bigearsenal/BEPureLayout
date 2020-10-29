import PureLayout

public extension UIView {
    convenience init(
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        backgroundColor: UIColor? = nil,
        cornerRadius: CGFloat? = nil
    ) {
        self.init(forAutoLayout: ())
        if let width = width {
            autoSetDimension(.width, toSize: width)
        }
        if let height = height {
            autoSetDimension(.height, toSize: height)
        }
        if let backgroundColor = backgroundColor {
            self.backgroundColor = backgroundColor
        }
        if let cornerRadius = cornerRadius {
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = true
        }
    }
    
    // MARK: - Helpers
    func autoPinToTopLeftCornerOfSuperview(
        xInset: CGFloat = 0,
        yInset: CGFloat? = nil
    ) {
        autoPinEdge(toSuperviewEdge: .top, withInset: yInset ?? xInset)
        autoPinEdge(toSuperviewEdge: .leading, withInset: xInset)
    }
    
    func autoPinToTopRightCornerOfSuperview(
        xInset: CGFloat = 0,
        yInset: CGFloat? = nil
    ) {
        autoPinEdge(toSuperviewEdge: .top, withInset: yInset ?? xInset)
        autoPinEdge(toSuperviewEdge: .trailing, withInset: xInset)
    }
    
    func autoPinToBottomLeftCornerOfSuperview(
        xInset: CGFloat = 0,
        yInset: CGFloat? = nil
    ) {
        autoPinEdge(toSuperviewEdge: .bottom, withInset: yInset ?? xInset)
        autoPinEdge(toSuperviewEdge: .leading, withInset: xInset)
    }
    
    func autoPinToBottomRightCornerOfSuperview(
        xInset: CGFloat = 0,
        yInset: CGFloat? = nil
    ) {
        autoPinEdge(toSuperviewEdge: .bottom, withInset: yInset ?? xInset)
        autoPinEdge(toSuperviewEdge: .trailing, withInset: xInset)
    }
    
    func autoPinToTopLeftCornerOfSuperviewSafeArea(
        xInset: CGFloat = 0,
        yInset: CGFloat? = nil
    ) {
        autoPinEdge(toSuperviewSafeArea: .top, withInset: yInset ?? xInset)
        autoPinEdge(toSuperviewSafeArea: .leading, withInset: xInset)
    }
    
    func autoPinToTopRightCornerOfSuperviewSafeArea(
        xInset: CGFloat = 0,
        yInset: CGFloat? = nil
    ) {
        autoPinEdge(toSuperviewSafeArea: .top, withInset: yInset ?? xInset)
        autoPinEdge(toSuperviewSafeArea: .trailing, withInset: xInset)
    }
    
    func autoPinToBottomLeftCornerOfSuperviewSafeArea(
        xInset: CGFloat = 0,
        yInset: CGFloat? = nil
    ) {
        autoPinEdge(toSuperviewSafeArea: .bottom, withInset: yInset ?? xInset)
        autoPinEdge(toSuperviewSafeArea: .leading, withInset: xInset)
    }
    
    func autoPinToBottomRightCornerOfSuperviewSafeArea(
        xInset: CGFloat = 0,
        yInset: CGFloat? = nil
    ) {
        autoPinEdge(toSuperviewSafeArea: .bottom, withInset: yInset ?? xInset)
        autoPinEdge(toSuperviewSafeArea: .trailing, withInset: xInset)
    }
    
    @available(iOS 11, *)
    func autoPinBottomToSuperViewSafeAreaAvoidKeyboard(inset: CGFloat = 0) {
        let keyboardViewV = AvoidingKeyboardLayoutConstraint(item: superview!.safeAreaLayoutGuide, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: inset)
        keyboardViewV.observeKeyboardHeight()
        superview?.addConstraint(keyboardViewV)
    }
    
    var centeredHorizontallyView: UIView {
        let view = UIView(forAutoLayout: ())
        view.addSubview(self)
        self.autoPinEdge(.top, to: .top, of: view)
        self.autoPinEdge(.bottom, to: .bottom, of: view)
        self.autoAlignAxis(toSuperviewAxis: .vertical)
        return view
    }
    
    func padding(_ inset: UIEdgeInsets) -> UIView {
        let view = UIView(forAutoLayout: ())
        view.addSubview(self)
        self.autoPinEdgesToSuperviewEdges(with: inset)
        return view
    }
    
    @discardableResult
    func onTap(_ target: Any?, action: Selector) -> Self {
        if self is UIButton {
            (self as? UIButton)?.addTarget(target, action: action, for: .touchUpInside)
            return self
        }
        let tap = UITapGestureRecognizer(target: target, action: action)
        addGestureRecognizer(tap)
        isUserInteractionEnabled = true
        return self
    }
    
    public func removeAllConstraints() {
        var _superview = self.superview
        
        while let superview = _superview {
            for constraint in superview.constraints {
                
                if let first = constraint.firstItem as? UIView, first == self {
                    superview.removeConstraint(constraint)
                }
                
                if let second = constraint.secondItem as? UIView, second == self {
                    superview.removeConstraint(constraint)
                }
            }
            
            _superview = superview.superview
        }
        
        self.removeConstraints(self.constraints)
    }
    
    public var constraintsToSuperview: [NSLayoutConstraint]? {
        guard let superview = superview else {return nil}
        return superview.constraints.filter {
            ($0.firstItem as? UIView == self && $0.secondItem as? UIView == superview) || ($0.firstItem as? UIView == superview && $0.secondItem as? UIView == superview)
        }
    }
    
    public func constraintToSuperviewWithAttribute(_ attribute: NSLayoutAttribute) -> NSLayoutConstraint? {
        constraintsToSuperview?.first {
            ($0.firstItem as? UIView == self && $0.firstAttribute == attribute) ||
            ($0.secondItem as? UIView == self && $0.secondAttribute == attribute)
        }
    }
    
    public static var spacer: UIView { UIView(forAutoLayout: ()) }
    public func separator(height: CGFloat, color: UIColor) -> UIView {
        UIView(height: height, backgroundColor: color)
    }
}
