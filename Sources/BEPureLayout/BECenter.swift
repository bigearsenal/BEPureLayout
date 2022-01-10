//
//  BECenter.swift
//  BEPureLayout
//
//  Created by Giang Long Tran on 09.01.22.
//

import Foundation

open class BECenter: BEView {
    let child: UIView
    
    public init() {
        child = UIView()
        super.init(frame: .zero)
    }
    
    required public init(@BEViewBuilder builder: Builder) {
        child = builder().build()
        super.init(frame: .zero)
    }
    
    final public override func commonInit() {
        super.commonInit()
        
        super.addSubview(child)
        for constraint in child.autoCenterInSuperview() { constraint.isActive = true }
    }
    
    open override func addSubview(_ view: UIView) {
        fatalError("addSubview is not allow!")
    }
}

