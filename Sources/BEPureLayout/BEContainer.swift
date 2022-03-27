//
//  BEContainer.swift
//  BEPureLayout
//
//  Created by Giang Long Tran on 09.12.21.
//

import UIKit

open class BEContainer: BEView {
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
        child.autoPinEdgesToSuperviewEdges()
    }
    
    open override func addSubview(_ view: UIView) {
        fatalError("addSubview is not allow!")
    }
}