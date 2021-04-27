//
//  ImagesViewController.swift
//  BEPureLayout_Example
//
//  Created by Chung Tran on 5/25/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import BEPureLayout

class ImagesViewController: BaseVerticalStackVC {
    override func setUp() {
        super.setUp()
        // images
        vStackView.addArrangedSubviews {
            UIImageView(width: 300, height: 200, imageNamed: "dogs")
            UIImageView(width: 300, height: 200, cornerRadius: 20, imageNamed: "cat")
            UIImageView(width: 100, height: 100, cornerRadius: 50, imageNamed: "avatar")
        }
    }
}
