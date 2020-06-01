//
//  NavBarVC.swift
//  BEPureLayout_Example
//
//  Created by Chung Tran on 5/31/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import BEPureLayout

class NavBarVC: BEViewController {
    var _preferedNavBarStyle: BEViewController.NavigationBarStyle
    
    override var preferredNavigationBarStype: BEViewController.NavigationBarStyle {
        _preferedNavBarStyle
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        switch _preferedNavBarStyle {
        case .normal(_, let backgroundColor, _, _, _):
            if backgroundColor == .white {return .default}
            return .lightContent
        default:
            return .default
        }
    }
    
    init(preferedNavBarStyle: BEViewController.NavigationBarStyle) {
        _preferedNavBarStyle = preferedNavBarStyle
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUp() {
        super.setUp()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "close", style: .done, target: self, action: #selector(close))
        // for HiddenTabBarVC
        switch _preferedNavBarStyle {
        case .hidden:
            let closeButton = UIButton(label: "back", textColor: .blue)
            view.addSubview(closeButton)
            closeButton.autoPinToTopLeftCornerOfSuperviewSafeArea(xInset: 16, yInset: 16)
            closeButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        case .normal(_, let backgroundColor, _, let textColor, _):
            self.title = (backgroundColor.name ?? "") + (textColor.name ?? "")
        default:
            break
        }
        
        // buttons
        let buttonStackView = UIStackView(axis: .vertical, spacing: 10, alignment: .center, distribution: .fillEqually)
        view.addSubview(buttonStackView)
        buttonStackView.autoCenterInSuperview()
        
        let button1 = UIButton(label: "WhiteBlack", textColor: .blue)
        button1.addTarget(self, action: #selector(openWhiteBlackNavBarVC), for: .touchUpInside)
        
        let button2 = UIButton(label: "RedWhite", textColor: .blue)
        button2.addTarget(self, action: #selector(openRedWhiteNavBarVC), for: .touchUpInside)
        
        let button3 = UIButton(label: "Hidden", textColor: .blue)
        button3.addTarget(self, action: #selector(openHiddenNavBarVC), for: .touchUpInside)
        
        buttonStackView.addArrangedSubview(button1)
        buttonStackView.addArrangedSubview(button2)
        buttonStackView.addArrangedSubview(button3)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.setNavigationBarBackgroundColor(.orange)
            self.setNavigationBarTitleStyle(textColor: .white, font: .systemFont(ofSize: 15))
        }
    }
    
    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func close() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func openWhiteBlackNavBarVC() {
        let vc = NavBarVC(preferedNavBarStyle: .normal(backgroundColor: .white, textColor: .black))
        show(vc, sender: self)
    }
    
    @objc func openRedWhiteNavBarVC() {
        let vc = NavBarVC(preferedNavBarStyle: .normal(backgroundColor: .red, textColor: .white))
        show(vc, sender: self)
    }
    
    @objc func openHiddenNavBarVC() {
        let vc = NavBarVC(preferedNavBarStyle: .hidden)
        show(vc, sender: self)
    }
}


extension UIColor {
    var name: String? {
        switch self {
        case UIColor.black: return "black"
        case UIColor.darkGray: return "darkGray"
        case UIColor.lightGray: return "lightGray"
        case UIColor.white: return "white"
        case UIColor.gray: return "gray"
        case UIColor.red: return "red"
        case UIColor.green: return "green"
        case UIColor.blue: return "blue"
        case UIColor.cyan: return "cyan"
        case UIColor.yellow: return "yellow"
        case UIColor.magenta: return "magenta"
        case UIColor.orange: return "orange"
        case UIColor.purple: return "purple"
        case UIColor.brown: return "brown"
        default: return nil
        }
    }
}
