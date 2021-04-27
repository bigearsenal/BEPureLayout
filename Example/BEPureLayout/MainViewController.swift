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
        
        buttonStackView.addArrangedSubviews {
            UIButton(label: "UIButton+UILabel", textColor: .blue)
                .onTap(self, action: #selector(openButtonsLabelsVC))
            UIButton(label: "UIImageView", textColor: .blue)
                .onTap(self, action: #selector(openImagesVC))
            UIButton(label: "UITextView", textColor: .blue)
                .onTap(self, action: #selector(openTextViewVC))
            UIButton(label: "UITextField", textColor: .blue)
                .onTap(self, action: #selector(openTextFieldVC))
            UIButton(label: "ContentHuggingScrollView", textColor: .blue)
                .onTap(self, action: #selector(openContentHuggingScrollVC))
            UIButton(label: "TableHeaderView", textColor: .blue)
                .onTap(self, action: #selector(openTableViewController))
            UIButton(label: "NavBarVC", textColor: .blue)
                .onTap(self, action: #selector(openNavBarVC))
        }
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
    
    @objc func openNavBarVC() {
        let vc = NavBarVC(preferedNavBarStyle: .normal(backgroundColor: .blue, textColor: .white))
        let nc = BENavigationController(rootViewController: vc)
        nc.modalPresentationStyle = .fullScreen
        show(nc, sender: self)
    }
}
