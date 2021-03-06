//
//  Numeric+PureLayout.swift
//  BEPureLayout
//
//  Created by Chung Tran on 10/22/20.
//

import Foundation

public extension CGFloat {
    // iPhone X as design template
    static let heightRatio: CGFloat = UIScreen.main.bounds.height / (UIApplication.shared.statusBarOrientation.isPortrait ? 812 : 375)
    static let widthRatio: CGFloat = UIScreen.main.bounds.width / (UIApplication.shared.statusBarOrientation.isPortrait ? 375 : 812)
}

public extension BinaryInteger {
    
    var adaptiveWidth: CGFloat {
        (CGFloat(self) * CGFloat.widthRatio).rounded(.down)
    }

    var adaptiveHeight: CGFloat {
        (CGFloat(self) * CGFloat.heightRatio).rounded(.down)
    }
}
