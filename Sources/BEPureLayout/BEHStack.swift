//
//  BEVStack.swift
//  BEPureLayout
//
//  Created by Giang Long Tran on 15.12.21.
//

import Foundation
import PureLayout

open class BEHStack: UIStackView {
    let children: [UIView]
    
    public init() {
        children = []
        super.init(frame: .zero)
    }
    
    required public init(
        spacing: CGFloat = 0,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill,
        @BEViewBuilder builder: Builder
    ) {
        children = builder()
        
        super.init(frame: .zero)
        
        self.axis = .horizontal
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        
        for view in children {
            addArrangedSubview(view)
        }
    }
    
    required public init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
