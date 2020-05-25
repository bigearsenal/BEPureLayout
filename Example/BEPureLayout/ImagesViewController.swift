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
        let image1 = UIImageView(width: 300, height: 200, imageNamed: "dogs")
        let image2 = UIImageView(width: 300, height: 200, cornerRadius: 20, imageNamed: "cat")
        let image3 = UIImageView(width: 100, height: 100, cornerRadius: 50, imageNamed: "avatar")
        vStackView.addArrangedSubview(image1)
        vStackView.addArrangedSubview(image2)
        vStackView.addArrangedSubview(image3)
    }
}
