//
// Created by Giang Long Tran on 15.02.2022.
//

import Foundation

public class BERef<T: UIView> {
    public weak var view: T?
    
    public init() {}
}

public extension UIView {
    open func bind<T>(_ ref: BERef<T>) -> Self {
        ref.view = self as? T
        return self
    }
}