//
//  BEZStack.swift
//  BEPureLayout
//
//  Created by Giang Long Tran on 15.12.21.
//

import UIKit
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
        public enum Edge {
            case top, left, bottom, right
        }
        
        case fill
        case center
        case pinEdges(_ edges: Set<Edge>, avoidKeyboard: Bool = false)
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
            if let superview = superview {
                superview.autoMatch(.height, to: .height, of: child, withOffset: 0, relation: .greaterThanOrEqual)
                superview.autoMatch(.width, to: .width, of: child, withOffset: 0, relation: .greaterThanOrEqual)
                autoPinEdgesToSuperviewEdges()
            }
        case .fill:
            child.autoPinEdgesToSuperviewEdges()
            if let superview = superview { autoPinEdgesToSuperviewEdges() }
        case .pinEdges(let edges, let avoidKeyboard):
            child.autoPinEdgesToSuperviewEdges()
            if let superview = superview {
                if edges.contains(.top) { autoPinEdge(toSuperviewEdge: .top) }
                if edges.contains(.left) { autoPinEdge(toSuperviewEdge: .left) }
                if edges.contains(.bottom) { avoidKeyboard ? autoPinBottomToSuperViewAvoidKeyboard(): autoPinEdge(toSuperviewEdge: .bottom) }
                if edges.contains(.right) { autoPinEdge(toSuperviewEdge: .right) }
            }
        }
    }
}
