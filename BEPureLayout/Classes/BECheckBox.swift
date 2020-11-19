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
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    open func commonInit() {
        // text
        setTitle(nil, for: .normal)
        setTitle(nil, for: .selected)
        
        // trigger
        isSelected = false
        addTarget(self, action: #selector(didTouch), for: .touchUpInside)
    }
    
    open override var isSelected: Bool {
        didSet {
            if isSelected {
                backgroundColor = BEPureLayoutConfigs.defaultCheckBoxActiveColor
                layer.borderWidth = 0
                let bundle = Bundle(for: self.classForCoder)
                let image = UIImage(named: "checkmark", in: bundle, compatibleWith: nil)!.withRenderingMode(.alwaysOriginal)
                setBackgroundImage(image, for: .selected)
            } else {
                backgroundColor = BEPureLayoutConfigs.defaultBackgroundColor
                layer.borderWidth = notShowOffCheckbox ? 0: 1
                layer.borderColor = BEPureLayoutConfigs.defaultCheckBoxActiveColor.cgColor
                setBackgroundImage(nil, for: .normal)
            }
        }
    }
    
    @objc open func didTouch() {
        isSelected.toggle()
    }
}
