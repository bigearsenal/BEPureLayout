//
// Created by Giang Long Tran on 09.12.21.
//

import Foundation

open class BECompositionView: BEView {
    open override func commonInit() {
        super.commonInit()
        
        let child = build()
        addSubview(child)
        child.autoPinEdgesToSuperviewEdges()
    }
    
    final public override func addSubview(_ view: UIView) {
        super.addSubview(view)
        view.autoPinEdgesToSuperviewEdges()
    }
    
    open func build() -> UIView {
        fatalError("Build method must override!")
    }
}