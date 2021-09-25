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
    
    private let shadowColor: UIColor
    private let shadowRadius: CGFloat
    private let shadowOffset: CGSize
    private let shadowOpacity: Float
    
    public init(shadowColor: UIColor = BEPureLayoutConfigs.defaultShadowColor, radius: CGFloat = 16, offset: CGSize = CGSize(width: 0, height: -6), opacity: Float = 0.08, cornerRadius: CGFloat, contentInset: UIEdgeInsets = .zero) {
        self.shadowColor = shadowColor
        self.shadowRadius = radius
        self.shadowOffset = offset
        self.shadowOpacity = opacity
        self.contentInset = contentInset
        self.mainViewCornerRadius = cornerRadius
        super.init(frame: .zero)
    }
    
    open override func commonInit() {
        super.commonInit()
        configureForAutoLayout()
        mainView.configureForAutoLayout()
        
        addSubview(mainView)
        mainView.autoPinEdgesToSuperviewEdges()
        
        mainView.addSubview(stackView)
        layoutStackView()
    }
    
    open func layoutStackView() {
        stackView.autoPinEdgesToSuperviewEdges(with: contentInset)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        addShadow(ofColor: shadowColor, radius: shadowRadius, offset: shadowOffset, opacity: shadowOpacity)
        roundCorners()
    }
    
    open func roundCorners() {
        mainView.layer.masksToBounds = true
        mainView.layer.cornerRadius = mainViewCornerRadius
    }
}
