//
//  BaseVerticalStackVC.swift
//  BEPureLayout_Example
//
//  Created by Chung Tran on 5/25/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import BEPureLayout

class BaseVerticalStackVC: BaseViewController {
    lazy var vStackView = UIStackView(axis: .vertical, spacing: 10, alignment: .center, distribution: .fill)
    
    override func setUp() {
        super.setUp()
        view.addSubview(vStackView)
        vStackView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16), excludingEdge: .bottom)
        
    }
}
