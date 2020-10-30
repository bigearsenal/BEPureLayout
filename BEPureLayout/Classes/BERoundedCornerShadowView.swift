//
//  BERoundedCornerShadowView.swift
//  BEPureLayout
//
//  Created by Chung Tran on 10/30/20.
//

import Foundation

open class BERoundedCornerShadowView: BEView {
    public lazy var mainView = UIView(backgroundColor: BEPureLayoutConfigs.defaultBackgroundColor)
    public lazy var stackView = UIStackView(axis: .horizontal, spacing: 10, alignment: .center, distribution: .fill)
    public var mainViewCornerRadius: CGFloat {
        didSet { setNeedsLayout() }
    }
    open override var backgroundColor: UIColor? {
        get { mainView.backgroundColor }
        set { mainView.backgroundColor = newValue }
    }
    
    public let contentInset: UIEdgeInsets
    
    public init(shadowColor: UIColor = BEPureLayoutConfigs.defaultShadowColor, radius: CGFloat = 16, offset: CGSize = CGSize(width: 0, height: -6), opacity: Float = 0.08, cornerRadius: CGFloat, contentInset: UIEdgeInsets = .zero) {
        self.contentInset = contentInset
        self.mainViewCornerRadius = cornerRadius
        super.init(frame: .zero)
        defer {
            addShadow(ofColor: shadowColor, radius: radius, offset: offset, opacity: opacity)
        }
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func commonInit() {
        super.commonInit()
        configureForAutoLayout()
        mainView.configureForAutoLayout()
        
        addSubview(mainView)
        mainView.autoPinEdgesToSuperviewEdges()
        
        mainView.addSubview(stackView)
    }
    
    open func layoutStackView() {
        stackView.autoPinEdgesToSuperviewEdges(with: contentInset)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners()
    }
    
    open func roundCorners() {
        layer.masksToBounds = true
        layer.cornerRadius = mainViewCornerRadius
    }
}
