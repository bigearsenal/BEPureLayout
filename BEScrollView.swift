//
//  BEScrollView.swift
//  BEPureLayout
//
//  Created by Giang Long Tran on 09.12.21.
//

import Foundation

public class BEScrollView: BEView {
    private let scrollView: ContentHuggingScrollView
    private let stackView: UIStackView
    var scrollViewBottomConstraint: NSLayoutConstraint!
    
    public init(contentInsets: UIEdgeInsets? = nil, spacing: CGFloat? = nil, @BEViewBuilder builder: Builder) {
        scrollView = ContentHuggingScrollView(scrollableAxis: .vertical, contentInset: contentInsets ?? .zero)
        stackView = UIStackView(axis: .vertical, spacing: spacing, alignment: .fill, distribution: .fill, arrangedSubviews: builder())
        super.init(frame: .zero)
    }
    
    final public override func commonInit() {
        super.commonInit()
        // scroll view for flexible height
        addSubview(scrollView)
        scrollView.autoPinEdgesToSuperviewSafeArea(with: .zero, excludingEdge: .bottom)
        scrollView.autoPinBottomToSuperViewAvoidKeyboard()
        
        // stackView
        scrollView.contentView.addSubview(stackView)
        stackView.autoPinEdgesToSuperviewEdges()
    }
}
