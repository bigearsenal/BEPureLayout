//
//  BEZStack.swift
//  BEPureLayout
//
//  Created by Giang Long Tran on 15.12.21.
//

import Foundation

open class BEZStack: BEView {
    let children: [UIView]
    
    public init() {
        children = []
        super.init(frame: .zero)
    }
    
    required public init(@BEViewBuilder builder: Builder) {
        children = builder()
        super.init(frame: .zero)
    }
    
    final public override func commonInit() {
        super.commonInit()
        children.forEach { child in super.addSubview(child) }
        
    }
    
    open override func addSubview(_ view: UIView) {
        fatalError("addSubview is not allow!")
    }

}
