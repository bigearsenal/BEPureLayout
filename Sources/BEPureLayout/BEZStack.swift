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
        case pinEdges(top: Bool, left: Bool, bottom: Bool, right: Bool)
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
            if let superview = superview { autoPinEdgesToSuperviewEdges() }
        case .fill:
            child.autoPinEdgesToSuperviewEdges()
            if let superview = superview { autoPinEdgesToSuperviewEdges() }
        case .pinEdges(top: let top, left: let left, bottom: let bottom, right: let right):
            child.autoPinEdgesToSuperviewEdges()
            if let superview = superview {
                if top { autoPinEdge(toSuperviewEdge: .top) }
                if left { autoPinEdge(toSuperviewEdge: .left) }
                if bottom { autoPinEdge(toSuperviewEdge: .bottom) }
                if right { autoPinEdge(toSuperviewEdge: .right) }
            }
        }
    }
}
