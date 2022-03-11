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
    
    public func popViewController(animated: Bool, completion: @escaping () -> Void) {
        if animated {
            CATransaction.begin()
            CATransaction.setCompletionBlock(completion)
        }
        
        popViewController(animated: animated)
        
        if animated {
            CATransaction.commit()
        } else {
            completion()
        }
    }
    public func pushViewController(_ vc: UIViewController, animated: Bool, completion: @escaping () -> Void) {
        if animated {
            CATransaction.begin()
            CATransaction.setCompletionBlock(completion)
        }
        
        pushViewController(vc, animated: animated)
        
        if animated {
            CATransaction.commit()
        } else {
            completion()
        }
    }
}
