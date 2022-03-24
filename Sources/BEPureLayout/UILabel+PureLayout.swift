//
//  UILabel+PureLayout.swift
//  BEPureLayout
//
//  Created by Chung Tran on 5/25/20.
//

import UIKit

public extension UILabel {
    convenience init(
        text: String? = nil,
        textSize: CGFloat = 15,
        weight: UIFont.Weight = .regular,
        font: UIFont? = nil,
        textColor: UIColor? = BEPureLayoutConfigs.defaultTextColor,
        numberOfLines: Int? = nil,
        textAlignment: NSTextAlignment? = nil
    ) {
        self.init(forAutoLayout: ())
        self.set(
            text: text,
            textSize: textSize,
            weight: weight,
            font: font,
            textColor: textColor,
            numberOfLines: numberOfLines,
            textAlignment: textAlignment
        )
    }
    
    @discardableResult
    func set(
        text: String? = nil,
        textSize: CGFloat = 15,
        weight: UIFont.Weight = .regular,
        font: UIFont? = nil,
        textColor: UIColor? = BEPureLayoutConfigs.defaultTextColor,
        numberOfLines: Int? = nil,
        textAlignment: NSTextAlignment? = nil
    ) -> Self {
        self.text = text
        self.font = font ?? .systemFont(ofSize: textSize, weight: weight)
        
        if let textColor = textColor {
            self.textColor = textColor
        }
        if let numberOfLines = numberOfLines {
            self.numberOfLines = numberOfLines
        }
        if let textAlignment = textAlignment {
            self.textAlignment = textAlignment
        }
        return self
    }
    
    @discardableResult
    func lineBreakMode(_ mode: NSLineBreakMode) -> Self {
        self.lineBreakMode = mode
        return self
    }
    
    @discardableResult
    func adjustsFontSizeToFitWidth() -> Self {
        self.adjustsFontSizeToFitWidth = true
        return self
    }
    
    @discardableResult
    func withAttributedText(_ attributedString: NSAttributedString, lineSpacing: CGFloat? = nil) -> Self {
        let attributedString = NSMutableAttributedString(attributedString: attributedString)
        if let lineSpacing = lineSpacing {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = lineSpacing
            attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
        }
        self.attributedText = attributedString
        return self
    }
}
