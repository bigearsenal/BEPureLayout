// Copyright 2022 P2P Validator Authors. All rights reserved.
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import Foundation

/// Take all available space in UIStackView
class BESpacer: UIView {
    enum Axis {
        case horizontal
        case vertical
    }
    
    let type: Axis
    
    init(_type: Axis) {
        self.type = type
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CoreGraphics.CGSize {
        switch type {
        case .horizontal: return .init(width: CGFloat.infinity, height: 0)
        case .vertical: return .init(width: 0, height: CGFloat.infinity)
        }
    }
}