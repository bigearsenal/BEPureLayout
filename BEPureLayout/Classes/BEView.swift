//
//  BEView.swift
//  BEPureLayout
//
//  Created by Chung Tran on 5/26/20.
//

import Foundation

open class BEView: UIView {
    // MARK: - Class Initialization
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    @available(*, unavailable,
    message: "Loading this view from a nib is unsupported in favor of initializer dependency injection."
    )
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Loading this view from a nib is unsupported in favor of initializer dependency injection.")
    }
    
    // MARK: - Custom Functions
    open func commonInit() {
        
    }
}
