//
//  BEDecimalTextField.swift
//  BEPureLayout
//
//  Created by Chung Tran on 20/11/2020.
//

import Foundation

open class BEDecimalTextField: UITextField {
    public var countAfterDecimalPoint: Int?
    public var maxNumber: Double?

    override public init(frame: CGRect) {
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
        
    }
    
    /// Use this function for validating textfield in UITextFieldDelegate.
    ///
    /// ```
    /// func textField(_ textField: UITextField, shouldChangeCharactersIn range...
    ///     if (textField as? DecimalTextField)?.shouldChangeCharactersInRange(range, replacementString: string) == true {...}
    ///     ...
    /// }
    /// ```
    open func shouldChangeCharactersInRange(_ range: NSRange, replacementString string: String) -> Bool {
        // fix conflict in decimal separator
        let decimalSeparator = Locale.current.decimalSeparator ?? "."
        let string = string
            .replacingOccurrences(of: ",", with: decimalSeparator)
            .replacingOccurrences(of: ".", with: decimalSeparator)
        
        // if input comma (or dot)
        if text?.isEmpty == true, string == Locale.current.decimalSeparator {
            text = "0\(decimalSeparator)"
            return false
        }
        
        // if deleting
        if string.isEmpty { return true }
        
        // get the current text, or use an empty string if that failed
        let currentText = text ?? ""

        // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else { return false }

        // add their new text to the existing text
        var updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        // check if newText is a Number
        let formatter = NumberFormatter()
        let isANumber = formatter.number(from: updatedText) != nil
        
        if updatedText.starts(with: "0") && !updatedText.starts(with: "0\(decimalSeparator)") {
            updatedText = currentText.replacingOccurrences(of: "^0+", with: "", options: .regularExpression)
            text = updatedText
        }

        return isANumber
            && textHasRightCountAfterDecimalPoint(text: updatedText, separator: decimalSeparator)
            && isNotMoreThanMax(text: updatedText)
    }

    func textHasRightCountAfterDecimalPoint(text: String, separator: String) -> Bool {
        guard
            let countAfterDecimalPoint = countAfterDecimalPoint,
            let indexOfSeparator = text.firstIndex (of: Character(separator))
        else {
            return true
        }

        return text.substring(from: text.index(after: indexOfSeparator)).count <= countAfterDecimalPoint
    }

    func isNotMoreThanMax(text: String) -> Bool {
        guard
            let maxNumber = maxNumber,
            let number = NumberFormatter().number(from: text)?.doubleValue
        else {
            return true
        }

        return number <= maxNumber
    }
}
