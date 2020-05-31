//
//  ButtonsViewController.swift
//  BEPureLayout_Example
//
//  Created by Chung Tran on 5/25/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import BEPureLayout

class ButtonsLabelsViewController: BEViewController {
    override func setUp() {
        super.setUp()
        // Main stackViews
        let hStackView = UIStackView(axis: .horizontal, spacing: 10, alignment: .top, distribution: .fillEqually)
        view.addSubview(hStackView)
        hStackView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))
        
        let buttonStackView = UIStackView(axis: .vertical, spacing: 10, alignment: .center, distribution: .fill)
        
        let labelsStackView = UIStackView(axis: .vertical, spacing: 10, alignment: .center, distribution: .fill)
        
        hStackView.addArrangedSubview(buttonStackView)
        hStackView.addArrangedSubview(labelsStackView)
        
        // Buttons stackView
        let button1 = UIButton(backgroundColor: .red, cornerRadius: 16, label: "first button", textColor: .white, contentInsets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        let button2 = UIButton(label: "second button", textColor: .systemBlue)
        buttonStackView.addArrangedSubview(button1)
        buttonStackView.addArrangedSubview(button2)
        
        // Labels stackView
        let label1 = UILabel(text: "first label", textSize: 20, weight: .bold, textColor: .red, textAlignment: .right)
        let label2 = UILabel(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", textColor: .blue, numberOfLines: 0)
        labelsStackView.addArrangedSubview(label1)
        labelsStackView.addArrangedSubview(label2)
    }
}
