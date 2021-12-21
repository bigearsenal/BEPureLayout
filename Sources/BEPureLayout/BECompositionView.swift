//
// Created by Giang Long Tran on 09.12.21.
//

import Foundation

open class BECompositionView: BEView {
    public init() {
        super.init(frame: .zero)
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    final public override func commonInit() {
        super.commonInit()
        
        let child = build()
        addSubview(child)
        child.autoPinEdgesToSuperviewEdges()
        
        // Will be use for late layout
        layout()
    }
    
    open func layout() {}
    
    final public override func addSubview(_ view: UIView) {
        super.addSubview(view)
        view.autoPinEdgesToSuperviewEdges()
    }
    
    open func build() -> UIView {
        fatalError("Build method must override!")
    }
}