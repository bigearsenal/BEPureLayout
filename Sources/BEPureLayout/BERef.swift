//
// Created by Giang Long Tran on 15.02.2022.
//

import UIKit

@dynamicMemberLookup
public class BERef<T: UIView> {
    public weak var view: T?
    
    public init() {}
    
    public subscript<R>(dynamicMember member: WritableKeyPath<T, R>) -> R {
        get { view![keyPath: member] }
        set { view?[keyPath: member] = newValue }
    }
}

public extension UIView {
    open func bind<T>(_ ref: BERef<T>) -> Self {
        ref.view = self as? T
        return self
    }
}