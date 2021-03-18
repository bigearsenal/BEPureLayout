//
//  BEStrokeAnimation.swift
//  BEPureLayout
//
//  Created by Chung Tran on 18/03/2021.
//

import Foundation

public class BEStrokeAnimation: CABasicAnimation {
    public enum StrokeType {
        case start, end
    }
    
    override init() {
        super.init()
    }
    
    public init(type: StrokeType,
         beginTime: Double = 0.0,
         fromValue: CGFloat,
         toValue: CGFloat,
         duration: Double) {
        
        super.init()
        
        self.keyPath = type == .start ? "strokeStart" : "strokeEnd"
        
        self.beginTime = beginTime
        self.fromValue = fromValue
        self.toValue = toValue
        self.duration = duration
        self.timingFunction = .init(name: .easeInEaseOut)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
