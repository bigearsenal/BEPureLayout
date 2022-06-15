// Copyright 2022 P2P Validator Authors. All rights reserved.
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import Foundation

/// Take all available space in UIStackView
public class BESpacer: UIView {
    public enum Axis {
        case horizontal
        case vertical
    }
    
    let type: Axis
    
    public init(_ type: Axis) {
        self.type = type
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public var intrinsicContentSize: CoreGraphics.CGSize {
        switch type {
        case .horizontal: return .init(width: 999_999, height: Self.noIntrinsicMetric)
        case .vertical: return .init(width: Self.noIntrinsicMetric, height: 999_999)
        }
    }
}