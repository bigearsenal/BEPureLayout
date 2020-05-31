//
//  MainViewController.swift
//  BEPureLayout_Example
//
//  Created by Chung Tran on 5/25/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import BEPureLayout

class MainViewController: BEViewController {
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
        button1.addTarget(self, action: #selector(openButtonsLabelsVC), for: .touchUpInside)
        
        let button2 = UIButton(label: "UIImageView", textColor: .blue)
        button2.addTarget(self, action: #selector(openImagesVC), for: .touchUpInside)
        
        let button3 = UIButton(label: "UITextView", textColor: .blue)
        button3.addTarget(self, action: #selector(openTextViewVC), for: .touchUpInside)
        
        let button4 = UIButton(label: "UITextField", textColor: .blue)
        button4.addTarget(self, action: #selector(openTextFieldVC), for: .touchUpInside)
        
        let button5 = UIButton(label: "ContentHuggingScrollView", textColor: .blue)
        button5.addTarget(self, action: #selector(openContentHuggingScrollVC), for: .touchUpInside)
        
        let button6 = UIButton(label: "TableHeaderView", textColor: .blue)
        button6.addTarget(self, action: #selector(openTableViewController), for: .touchUpInside)
        
        buttonStackView.addArrangedSubview(button1)
        buttonStackView.addArrangedSubview(button2)
        buttonStackView.addArrangedSubview(button3)
        buttonStackView.addArrangedSubview(button4)
        buttonStackView.addArrangedSubview(button5)
        buttonStackView.addArrangedSubview(button6)
    }
    
    // MARK: - Actions
    @objc func openButtonsLabelsVC() {
        let vc = ButtonsLabelsViewController()
        show(vc, sender: self)
    }
    
    @objc func openImagesVC() {
        let vc = ImagesViewController()
        show(vc, sender: self)
    }
    
    @objc func openTextViewVC() {
        let vc = TextViewVC()
        show(vc, sender: self)
    }
    
    @objc func openTextFieldVC() {
        let vc = TextFieldVC()
        show(vc, sender: self)
    }
    
    @objc func openContentHuggingScrollVC() {
        let vc = ContentHuggingScrollVC()
        show(vc, sender: self)
    }
    
    @objc func openTableViewController() {
        let vc = TableViewController()
        show(vc, sender: self)
    }
}
