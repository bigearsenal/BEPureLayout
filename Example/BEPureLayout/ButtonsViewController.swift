//
//  ButtonsViewController.swift
//  BEPureLayout_Example
//
//  Created by Chung Tran on 5/25/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import BEPureLayout

class ButtonsViewController: BaseViewController {
    override func setUp() {
        super.setUp()
        
        let button1 = UIButton(backgroundColor: .red, cornerRadius: 16, label: "first button", textColor: .white, contentInsets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        view.addSubview(button1)
        button1.autoCenterInSuperview()
    }
}
