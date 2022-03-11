//
//  UIViewController+Extensions.swift
//  BEPureLayout
//
//  Created by Chung Tran on 11/03/2022.
//

import Foundation

extension UIViewController {
    public func close(_ completion: (() -> Void)? = nil) {
        if let nc = navigationController, nc.viewControllers.first != self {
            nc.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: completion)
        }
    }
    
    public func backCompletion(animated: Bool = true, completion: (() -> Void)?) {
        if let nc = navigationController, nc.viewControllers.first != self {
            if let completion = completion {
                nc.popViewController(animated: animated, completion: completion)
            } else {
                nc.popViewController(animated: animated)
            }
        } else {
            dismiss(animated: animated, completion: completion)
        }
    }
}
