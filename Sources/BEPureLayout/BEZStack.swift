//
//  BEZStack.swift
//  BEPureLayout
//
//  Created by Giang Long Tran on 15.12.21.
//

import Foundation
import PureLayout

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

open class BEZStackPosition: BEView {
    
    public enum Mode {
        case fill
        case center
    }
    
    let mode: Mode
    let child: UIView
    
    required public init(mode: Mode = .fill, @BEViewBuilder builder: Builder) {
        self.mode = mode
        child = builder().build()
        super.init(frame: .zero)
    }
    
    final public override func commonInit() {
        super.commonInit()
        addSubview(child)
    }
    
    open override func didMoveToSuperview() {
        switch (mode) {
        case .center:
            for constraint in child.autoCenterInSuperview() { constraint.isActive = true }
        case .fill:
            child.autoPinEdgesToSuperviewEdges()
        }
        
        if let superview = superview {
            autoPinEdgesToSuperviewEdges()
        }
    }
}
