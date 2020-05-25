//
//  TextViewVC.swift
//  BEPureLayout_Example
//
//  Created by Chung Tran on 5/25/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import BEPureLayout

class TextViewVC: BaseVerticalStackVC {
    override func setUp() {
        super.setUp()
        vStackView.alignment = .leading
        
        let label = UILabel(text: "Expandable TextView", textSize: 20, weight: .bold, textColor: .black)
        label.setContentHuggingPriority(.required, for: .vertical)
        
        let textView = UITextView(forExpandable: ())
        textView.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        
        vStackView.addArrangedSubview(label)
        vStackView.addArrangedSubview(textView)
    }
}
