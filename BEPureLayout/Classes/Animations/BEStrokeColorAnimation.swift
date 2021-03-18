//
//  BEStrokeColorAnimation.swift
//  BEPureLayout
//
//  Created by Chung Tran on 18/03/2021.
//

import Foundation

public class StrokeColorAnimation: CAKeyframeAnimation {
    override init() {
        super.init()
    }
    
    public init(colors: [CGColor], duration: Double) {
        
        super.init()
        
        self.keyPath = "strokeColor"
        self.values = colors
        self.duration = duration
        self.repeatCount = .greatestFiniteMagnitude
        self.timingFunction = .init(name: .easeInEaseOut)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
