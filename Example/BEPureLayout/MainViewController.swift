//
//  MainViewController.swift
//  BEPureLayout_Example
//
//  Created by Chung Tran on 5/25/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import BEPureLayout

class MainViewController: BaseViewController{
    override func setUp() {
        super.setUp()
        
        // Corner views
        let topLeftView = UIView(width: 100, height: 100, backgroundColor: .green, cornerRadius: 16)
        view.addSubview(topLeftView)
        topLeftView.autoPinToTopLeftCornerOfSuperviewSafeArea(xInset: 16, yInset: 16)
        
        let topRightView = UIView(width: 100, height: 100, backgroundColor: .red, cornerRadius: 16)
        view.addSubview(topRightView)
        topRightView.autoPinToTopRightCornerOfSuperviewSafeArea(xInset: 16)
        
        let bottomLeftView = UIView(width: 100, height: 100, backgroundColor: .blue, cornerRadius: 16)
        view.addSubview(bottomLeftView)
        bottomLeftView.autoPinToBottomLeftCornerOfSuperview(xInset: 16)
        
        let bottomRightView = UIView(width: 100, height: 100, backgroundColor: .yellow, cornerRadius: 16)
        view.addSubview(bottomRightView)
        bottomRightView.autoPinToBottomRightCornerOfSuperview(xInset: 16)
        
        // buttons
        let buttonStackView = UIStackView(axis: .vertical, spacing: 10, alignment: .center, distribution: .fillEqually)
        view.addSubview(buttonStackView)
        buttonStackView.autoCenterInSuperview()
        
        let button1 = UIButton(label: "UIButton+UILabel", textColor: .blue)
        button1.addTarget(self, action: #selector(openButtonsVC), for: .touchUpInside)
        
        let button2 = UIButton(label: "UILabel+AutoLayout", textColor: .blue)
        buttonStackView.addArrangedSubview(button1)
        buttonStackView.addArrangedSubview(button2)
    }
    
    // MARK: - Actions
    @objc func openButtonsVC() {
        let vc = ButtonsLabelsViewController()
        show(vc, sender: self)
    }
}
