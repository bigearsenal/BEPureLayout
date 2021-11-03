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
    
    func autoAdjustWidthHeightRatio(_ ratio: CGFloat) {
        widthAnchor.constraint(equalTo: heightAnchor, multiplier: ratio).isActive = true
    }
    
    @available(iOS 11, *)
    func autoPinBottomToSuperViewSafeAreaAvoidKeyboard(inset: CGFloat = 0) {
        let keyboardViewV = AvoidingKeyboardLayoutConstraint(item: superview!.safeAreaLayoutGuide, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: inset)
        keyboardViewV.observeKeyboardHeight()
        superview?.addConstraint(keyboardViewV)
    }
    
    func autoPinBottomToSuperViewAvoidKeyboard(inset: CGFloat = 0) {
        let keyboardViewV = AvoidingKeyboardLayoutConstraint(item: superview!, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: inset)
        keyboardViewV.observeKeyboardHeight()
        superview?.addConstraint(keyboardViewV)
    }
    
    func autoPinBottomAvoidKeyboard(to view: UIView, inset: CGFloat = 0) {
        let keyboardViewV = AvoidingKeyboardLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: inset)
        keyboardViewV.observeKeyboardHeight()
        view.addConstraint(keyboardViewV)
    }
    
    func autoCenterInSuperView(leftInset: CGFloat, rightInset: CGFloat? = nil) {
        autoPinEdge(toSuperviewEdge: .leading, withInset: leftInset)
        autoPinEdge(toSuperviewEdge: .trailing, withInset: rightInset ?? leftInset)
        autoAlignAxis(toSuperviewAxis: .horizontal)
    }
    
//    @available(*, deprecated, renamed: "centered(_:)")
    var centeredHorizontallyView: UIView {
        let view = UIView(forAutoLayout: ())
        view.addSubview(self)
        view.tag = UIView.wrapperViewTag
        self.autoPinEdge(.top, to: .top, of: view)
        self.autoPinEdge(.bottom, to: .bottom, of: view)
        self.autoAlignAxis(toSuperviewAxis: .vertical)
        return view
    }
    
    func centered(_ axis: NSLayoutConstraint.Axis) -> UIView {
        let view = UIView(forAutoLayout: ())
        view.addSubview(self)
        view.tag = UIView.wrapperViewTag
        switch axis {
        case .horizontal:
            self.autoPinEdge(.top, to: .top, of: view)
            self.autoPinEdge(.bottom, to: .bottom, of: view)
            self.autoAlignAxis(toSuperviewAxis: .vertical)
            self.autoPinEdge(toSuperviewEdge: .leading, withInset: 0, relation: .greaterThanOrEqual)
            self.autoPinEdge(toSuperviewEdge: .trailing, withInset: 0, relation: .greaterThanOrEqual)
        case .vertical:
            self.autoPinEdge(.leading, to: .leading, of: view)
            self.autoPinEdge(.trailing, to: .trailing, of: view)
            self.autoAlignAxis(toSuperviewAxis: .horizontal)
            self.autoPinEdge(toSuperviewEdge: .top, withInset: 0, relation: .greaterThanOrEqual)
            self.autoPinEdge(toSuperviewEdge: .bottom, withInset: 0, relation: .greaterThanOrEqual)
        }
        return view
    }
    
    // MARK: - Convenience methods
    var widthConstraint: NSLayoutConstraint? {
        constraints.first(where: {$0.firstAttribute == .width && $0.secondAttribute == .notAnAttribute})
    }
    
    var heightConstraint: NSLayoutConstraint? {
        constraints.first(where: {$0.firstAttribute == .height && $0.secondAttribute == .notAnAttribute})
    }
    
    // MARK: - Wrapper
    private static let wrapperViewTag = 1111
    func padding(_ inset: UIEdgeInsets, backgroundColor: UIColor? = nil, cornerRadius: CGFloat? = nil) -> UIView {
        let view = UIView(forAutoLayout: ())
        if let bgColor = backgroundColor {
            view.backgroundColor = bgColor
        }
        
        if let cornerRadius = cornerRadius {
            view.layer.cornerRadius = cornerRadius
            view.layer.masksToBounds = true
        }
        view.tag = UIView.wrapperViewTag
        view.addSubview(self)
        self.autoPinEdgesToSuperviewEdges(with: inset)
        return view
    }
    
    @discardableResult
    func border(width: CGFloat, color: UIColor) -> Self {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
        return self
    }
    
    var wrapper: UIView? {
        superview?.tag == UIView.wrapperViewTag ? superview: nil
    }
    
    @objc open func fittingHeight(targetWidth: CGFloat) -> CGFloat {
        let fittingSize = CGSize(
            width: targetWidth,
            height: UIView.layoutFittingCompressedSize.height
        )
        return systemLayoutSizeFitting(fittingSize, withHorizontalFittingPriority: .required,
                                verticalFittingPriority: .defaultLow)
            .height
    }
    
    @discardableResult
    func onTap(_ target: Any?, action: Selector) -> Self {
        if self is UIButton {
            (self as? UIButton)?.removeTarget(nil, action: nil, for: .touchUpInside)
            (self as? UIButton)?.addTarget(target, action: action, for: .touchUpInside)
            return self
        }
        let tap = UITapGestureRecognizer(target: target, action: action)
        addGestureRecognizer(tap)
        isUserInteractionEnabled = true
        return self
    }
    
    @discardableResult
    func onSwipe(_ target: Any?, action: Selector) -> Self {
        let swipe = UIPanGestureRecognizer(target: target, action: action)
        addGestureRecognizer(swipe)
        isUserInteractionEnabled = true
        return self
    }
    
    func removeAllConstraints() {
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
    
    var constraintsToSuperview: [NSLayoutConstraint]? {
        guard let superview = superview else {return nil}
        return superview.constraints.filter {
            ($0.firstItem as? UIView == self && $0.secondItem as? UIView == superview) || ($0.firstItem as? UIView == superview && $0.secondItem as? UIView == superview) || ($0.firstItem as? UIView == self && $0.secondItem as? UILayoutGuide == superview.safeAreaLayoutGuide) || ($0.firstItem as? UILayoutGuide == superview.safeAreaLayoutGuide && $0.secondItem as? UIView == self)
        }
    }
    
    func constraintToSuperviewWithAttribute(_ attribute: NSLayoutConstraint.Attribute) -> NSLayoutConstraint? {
        constraintsToSuperview?.first {
            ($0.firstItem as? UIView == self && $0.firstAttribute == attribute) ||
            ($0.secondItem as? UIView == self && $0.secondAttribute == attribute)
        }
    }
    
    func constraints(toRelativeView view: UIView) -> [NSLayoutConstraint] {
        superview?.constraints.filter {
            ($0.firstItem as? UIView == self && $0.secondItem as? UIView == view) ||
            ($0.firstItem as? UIView == view && $0.secondItem as? UIView == self)
        } ?? []
    }
    
    func constraint(toRelativeView view: UIView, withAttribute attribute: NSLayoutConstraint.Attribute) -> NSLayoutConstraint? {
        constraints(toRelativeView: view)
            .first {
                ($0.firstItem as? UIView == self && $0.firstAttribute == attribute) ||
                ($0.secondItem as? UIView == self && $0.secondAttribute == attribute)
            }
    }
    
    static var spacer: UIView { UIView(forAutoLayout: ()) }
    static func separator(height: CGFloat, color: UIColor = .clear) -> UIView {
        UIView(height: height, backgroundColor: color)
    }
    
    func addShadow(ofColor color: UIColor = UIColor(red: 0.07, green: 0.47, blue: 0.57, alpha: 1.0), radius: CGFloat = 3, offset: CGSize = .zero, opacity: Float = 0.5) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius))

        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
    
    @discardableResult
    func withTag(_ tag: Int) -> Self {
        self.tag = tag
        return self
    }
    
    @discardableResult
    func withContentHuggingPriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> Self
    {
        setContentHuggingPriority(priority, for: axis)
        return self
    }
    
    @discardableResult
    func withContentCompressionResistancePriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> Self
    {
        setContentCompressionResistancePriority(priority, for: axis)
        return self
    }
    
    @discardableResult
    func withModifier(_ modify: (Self) -> Self) -> Self {
        modify(self)
    }
    
    @discardableResult
    func withCenteredChild(_ child: UIView) -> Self {
        self.addSubview(child)
        child.autoCenterInSuperview()
        return self
    }
    
    @discardableResult
    func hidden(_ hide: Bool = true) -> Self {
        self.isHidden = true
        return self
    }
}
