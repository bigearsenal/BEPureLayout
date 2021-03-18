//
//  BESpinnerView.swift
//  BEPureLayout
//
//  Created by Chung Tran on 18/03/2021.
//

import Foundation

open class BESpinnerView: BEView {
    public var startColor: UIColor = .white { didSet { setNeedsLayout() } }
    public var endColor: UIColor = .black { didSet { setNeedsLayout() } }
    public var lineWidth: CGFloat = 4 { didSet { setNeedsLayout() } }

    private let gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.type = .conic
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        return gradientLayer
    }()

    open override func commonInit() {
        layer.addSublayer(gradientLayer)
    }

    open override func layoutSubviews() {
        super.layoutSubviews()

        gradientLayer.frame = bounds
        gradientLayer.colors = [startColor, endColor].map { $0.cgColor }
        
        gradientLayer.mask = createStrokeLayerMask()
    }
    
    // MARK: - Helpers
    private func createStrokeLayerMask() -> CAShapeLayer {
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = (min(bounds.width, bounds.height) - lineWidth) / 2
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        
        let mask = CAShapeLayer()
        mask.fillColor = UIColor.clear.cgColor
        mask.strokeColor = UIColor.white.cgColor
        mask.lineWidth = lineWidth
        mask.path = path.cgPath
        mask.lineCap = .round
        return mask
    }
    
    // MARK: - Animation
    open func animate() {
        animateRotation()
    }
    
    private func animateRotation() {
        let rotationAnimation = BERotationAnimation(
            direction: .z,
            fromValue: 0,
            toValue: CGFloat.pi * 2,
            duration: 2,
            repeatCount: .greatestFiniteMagnitude
        )
        
        layer.add(rotationAnimation, forKey: nil)
    }
}
