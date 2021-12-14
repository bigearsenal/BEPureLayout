//
// Created by Giang Long Tran on 14.12.21.
//

import Foundation

open class BESafeArea: BEView {
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
        child.autoPinEdgesToSuperviewSafeArea()
    }
    
    open override func addSubview(_ view: UIView) {
        fatalError("addSubview is not allow!")
    }
}