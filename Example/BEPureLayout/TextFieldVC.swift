//
//  TextFieldVC.swift
//  BEPureLayout_Example
//
//  Created by Chung Tran on 5/25/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import BEPureLayout

class TextFieldVC: BaseVerticalStackVC {
    override func setUp() {
        super.setUp()
        let tf1 = UITextField(placeholder: "TextField with padding", horizontalPadding: 16)
        tf1.setContentHuggingPriority(.required, for: .vertical)
        let tf2 = UITextField(
            placeholder: "TextField with leftView, rightView",
            leftView: UIView(width: 10, backgroundColor: .red),
            leftViewMode: .always,
            rightView: UIView(width: 10, backgroundColor: .blue),
            rightViewMode: .always
        )
        
        vStackView.addArrangedSubview(tf1)
        vStackView.addArrangedSubview(tf2)
    }
}
