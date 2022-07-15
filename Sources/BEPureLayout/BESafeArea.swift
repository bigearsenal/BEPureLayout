//
// Created by Giang Long Tran on 14.12.21.
//

import Foundation
import PureLayout

open class BESafeArea: BEView {
    let child: UIView
    
    private let top: Bool
    private let leading: Bool
    private let trailing: Bool
    private let bottom: Bool

    public init(top: Bool = true, leading: Bool = true, trailing: Bool = true, bottom: Bool = true) {
        child = UIView()
        self.top = top
        self.leading = leading
        self.trailing = trailing
        self.bottom = bottom
        super.init(frame: .zero)
    }
    
    required public init(top: Bool = true, leading: Bool = true, trailing: Bool = true, bottom: Bool = true, @BEViewBuilder builder: Builder) {
        child = builder().build()
        self.top = top
        self.leading = leading
        self.trailing = trailing
        self.bottom = bottom
        super.init(frame: .zero)
    }
    
    final public override func commonInit() {
        super.commonInit()
        
        super.addSubview(child)

        if top, leading, trailing, bottom {
            child.autoPinEdgesToSuperviewSafeArea()
        }
        else {
            set(edge: .top, isSafeArea: top)
            set(edge: .leading, isSafeArea: leading)
            set(edge: .trailing, isSafeArea: trailing)
            set(edge: .bottom, isSafeArea: bottom)
        }
    }
    
    open override func addSubview(_ view: UIView) {
        fatalError("addSubview is not allow!")
    }

    private func set(edge: ALEdge, isSafeArea: Bool) {
        if isSafeArea {
            child.autoPinEdge(toSuperviewSafeArea: edge)
        }
        else {
            child.autoPinEdge(toSuperviewEdge: edge)
        }
    }
}
