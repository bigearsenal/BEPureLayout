//
//  ViewController.swift
//  BEPureLayout
//
//  Created by bigearsenal on 05/25/2020.
//  Copyright (c) 2020 bigearsenal. All rights reserved.
//

import UIKit
import BEPureLayout

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view, typically from a nib.
        
        setUp()
    }
    
    func setUp() {
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
    }

}

