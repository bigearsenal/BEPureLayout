//
//  BECheckBox.swift
//  BEPureLayout
//
//  Created by Chung Tran on 19/11/2020.
//

import UIKit

open class BECheckbox: UIButton {
    var notShowOffCheckbox = false

    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    @available(*, unavailable,
    message: "Loading this view from a nib is unsupported in favor of initializer dependency injection."
    )
    public required init?(coder: NSCoder) {
        fatalError("Loading this view from a nib is unsupported in favor of initializer dependency injection.")
    }
    
    open func commonInit() {
        // text
        setTitle(nil, for: .normal)
        setTitle(nil, for: .selected)
        
        // trigger
        isSelected = false
        addTarget(self, action: #selector(didTouch), for: .touchUpInside)
        
        layer.borderColor = BEPureLayoutConfigs.defaultCheckBoxActiveColor.cgColor
    }
    
    open override var isSelected: Bool {
        didSet {
            if isSelected {
                backgroundColor = BEPureLayoutConfigs.defaultCheckBoxActiveColor
                layer.borderWidth = 0
                let image = UIImage(named: "checkmark", in: Bundle(for: Self.self), compatibleWith: nil)!.withRenderingMode(.alwaysOriginal)
                setBackgroundImage(image, for: .selected)
            } else {
                backgroundColor = BEPureLayoutConfigs.defaultBackgroundColor
                layer.borderWidth = notShowOffCheckbox ? 0: 1
                setBackgroundImage(nil, for: .normal)
            }
        }
    }
    
    @objc open func didTouch() {
        isSelected.toggle()
    }
}
