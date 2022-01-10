//
//  BECollectionCell.swift
//  BEPureLayout
//
//  Created by Giang Long Tran on 08.01.22.
//

import Foundation

open class BECollectionCell: UICollectionViewCell {
    public init() {
        super.init(frame: .zero)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        let child = build()
        contentView.addSubview(child)
        child.autoPinEdgesToSuperviewEdges()
    }
    
    open func build() -> UIView {
        fatalError("Build method must override!")
    }
}
