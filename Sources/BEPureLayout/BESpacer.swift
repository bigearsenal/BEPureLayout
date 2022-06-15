// Copyright 2022 P2P Validator Authors. All rights reserved.
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import Foundation

/// Take all available space in UIStackView
class BESpacer: UIView {
    enum Type {
        case horizontal
        case vertical
    }
    
    let type: Type
    
    override init(type: Type) {
        self.type = type
        super.init(frame: .zero)
    }
    
    override var intrinsicContentSize: CoreGraphics.CGSize {
        switch type {
        case .horizontal: return .init(width: CGFloat.infinity, height: 0)
        case .vertical: return .init(width: 0, height: CGFloat.infinity)
        }
    }
}