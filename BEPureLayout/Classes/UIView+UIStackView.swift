//
//  UIView+UIStackView.swift
//  BEPureLayout
//
//  Created by Chung Tran on 27/11/2020.
//

import Foundation

public extension UIView {
    static func row(_ arrangedSubviews: [UIView]) -> UIStackView
    {
        UIStackView(axis: .horizontal, spacing: 10, alignment: .center, distribution: .equalSpacing, arrangedSubviews: arrangedSubviews)
    }
    
    static func col(_ arrangedSubviews: [UIView]) -> UIStackView
    {
        UIStackView(axis: .vertical, spacing: 10, alignment: .fill, distribution: .fill, arrangedSubviews: arrangedSubviews)
    }
    
    func row(_ arrangedSubviews: [UIView], padding: UIEdgeInsets = .zero) -> UIStackView {
        let row = UIView.row(arrangedSubviews)
        addSubview(row)
        row.autoPinEdgesToSuperviewEdges(with: padding)
        return row
    }
    
    func col(_ arrangedSubviews: [UIView], padding: UIEdgeInsets = .zero) -> UIStackView
    {
        let col = UIView.col(arrangedSubviews)
        addSubview(col)
        col.autoPinEdgesToSuperviewEdges(with: padding)
        return col
    }
}
