//
//  ImagesViewController.swift
//  BEPureLayout_Example
//
//  Created by Chung Tran on 5/25/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import BEPureLayout

class ImagesViewController: BaseViewController {
    override func setUp() {
        super.setUp()
        // Main stackViews
        let hStackView = UIStackView(axis: .vertical, spacing: 10, alignment: .center, distribution: .fill)
        view.addSubview(hStackView)
        hStackView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))
        
        // images
        let image1 = UIImageView(width: 300, height: 200, imageNamed: "dogs")
        let image2 = UIImageView(width: 300, height: 200, cornerRadius: 20, imageNamed: "cat")
        let image3 = UIImageView(width: 100, height: 100, cornerRadius: 50, imageNamed: "avatar")
        hStackView.addArrangedSubview(image1)
        hStackView.addArrangedSubview(image2)
        hStackView.addArrangedSubview(image3)
    }
}
