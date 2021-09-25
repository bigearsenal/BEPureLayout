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
        vStackView.addArrangedSubviews {
            UITextField(placeholder: "TextField with padding", horizontalPadding: 16)
                .withContentHuggingPriority(.required, for: .vertical)
            
            UITextField(
                placeholder: "TextField with leftView, rightView",
                leftView: UIView(width: 10, backgroundColor: .red),
                leftViewMode: .always,
                rightView: UIView(width: 10, backgroundColor: .blue),
                rightViewMode: .always
            )
        }
    }
}
