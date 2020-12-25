//
//  UITextField+PureLayout.swift
//  BEPureLayout
//
//  Created by Chung Tran on 5/25/20.
//

import Foundation

public extension UITextField {
    convenience init(
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        backgroundColor: UIColor? = nil,
        cornerRadius: CGFloat? = nil,
        font: UIFont? = nil,
        textColor: UIColor? = nil,
        keyboardType: UIKeyboardType? = nil,
        placeholder: String?,
        placeholderTextColor: UIColor? = nil,
        autocorrectionType: UITextAutocorrectionType? = nil,
        autocapitalizationType: UITextAutocapitalizationType? = nil,
        spellCheckingType: UITextSpellCheckingType? = nil,
        textContentType: UITextContentType? = nil,
        isSecureTextEntry: Bool = false,
        horizontalPadding: CGFloat? = nil,
        leftView: UIView? = nil,
        leftViewMode: UITextField.ViewMode? = nil,
        rightView: UIView? = nil,
        rightViewMode: UITextField.ViewMode? = nil,
        showClearButton: Bool = false
    ) {
        self.init(width: width, height: height, backgroundColor: backgroundColor, cornerRadius: cornerRadius)
        if let textColor = textColor {
            self.textColor = textColor
        }
        
        if let font = font {
            self.font = font
        }
        if let keyboardType = keyboardType {
            self.keyboardType = keyboardType
        }
        
        self.placeholder = placeholder
        
        if let placeholderTextColor = placeholderTextColor {
            attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: [.foregroundColor: placeholderTextColor])
        }
        
        if let autocorrectionType = autocorrectionType {
            self.autocorrectionType = autocorrectionType
        }
        if let autocapitalizationType = autocapitalizationType {
            self.autocapitalizationType = autocapitalizationType
        }
        if let spellCheckingType = spellCheckingType {
            self.spellCheckingType = spellCheckingType
        }
        
        if let textContentType = textContentType {
            if #available(iOS 10.0, *) {
                self.textContentType = textContentType
            } else {
                // Fallback on earlier versions
            }
        }
        
        self.isSecureTextEntry = isSecureTextEntry
        
        if let horizontalPadding = horizontalPadding {
            self.leftView = UIView(width: horizontalPadding, height: height ?? 1)
            self.leftViewMode = .always
            
            self.rightView = UIView(width: horizontalPadding, height: height ?? 1)
            self.rightViewMode = .always
        }
        
        // NOTE: These properties override horizontalPadding property
        if let leftView = leftView {
            leftView.autoSetDimension(.height, toSize: height ?? 16)
            self.leftView = leftView
            self.leftViewMode = leftViewMode ?? .always
        }
        
        if let rightView = rightView {
            rightView.autoSetDimension(.height, toSize: height ?? 16)
            self.rightView = rightView
            self.rightViewMode = rightViewMode ?? .always
        }
        
        if !showClearButton {
            rightView?.autoSetDimension(.height, toSize: height ?? 16)
        } else {
            self.clearButtonMode = .whileEditing
        }
        
    }
}
