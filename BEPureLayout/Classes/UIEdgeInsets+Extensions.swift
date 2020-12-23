//
//  UIEdgeInsets+Extensions.swift
//  p2p_wallet
//
//  Created by Chung Tran on 11/3/20.
//

import Foundation

public extension UIEdgeInsets {
    mutating func modify(dTop: CGFloat? = nil, dLeft: CGFloat? = nil, dBottom: CGFloat? = nil, dRight: CGFloat? = nil) {
        self = self.modifying(dTop: dTop, dLeft: dLeft, dBottom: dBottom, dRight: dRight)
    }
    
    func modifying(dTop: CGFloat? = nil, dLeft: CGFloat? = nil, dBottom: CGFloat? = nil, dRight: CGFloat? = nil) -> UIEdgeInsets {
        var insets = self
        if let dTop = dTop {
            insets.top += dTop
        }
        if let dLeading = dLeft {
            insets.left += dLeading
        }
        if let dBottom = dBottom {
            insets.bottom += dBottom
        }
        if let dRight = dRight {
            insets.right += dRight
        }
        return insets
    }
    
    init(x: CGFloat, y: CGFloat) {
        self.init(top: y, left: x, bottom: y, right: x)
    }
    
    init(all inset: CGFloat) {
        self.init(top: inset, left: inset, bottom: inset, right: inset)
    }
}
