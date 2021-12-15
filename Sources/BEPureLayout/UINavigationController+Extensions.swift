//
//  UINavigationController+Extensions.swift
//  BEPureLayout
//
//  Created by Chung Tran on 5/31/20.
//

import Foundation

extension UINavigationController {
    public var previousController: UIViewController? {
        if viewControllers.count > 1 {
            return viewControllers[viewControllers.count-2]
        }
        return nil
    }
}
