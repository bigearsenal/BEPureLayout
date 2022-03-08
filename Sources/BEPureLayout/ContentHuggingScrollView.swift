//
//  ContentHuggingScrollView.swift
//  Commun
//
//  Created by Chung Tran on 11/1/19.
//  Copyright © 2019 Commun Limited. All rights reserved.
//

import Foundation

public class ContentHuggingScrollView: UIScrollView {
    // MARK: - Subviews
    public lazy var contentView = UIView(forAutoLayout: ())
    var scrollableAxis: NSLayoutConstraint.Axis
    
    private var contentViewWidthConstraint: NSLayoutConstraint?
    private var contentViewHeightConstraint: NSLayoutConstraint?
    
    public override var contentInset: UIEdgeInsets {
        didSet {
            if scrollableAxis == .vertical {
                contentViewWidthConstraint?.constant = -(contentInset.left + contentInset.right)
                contentView.setNeedsLayout()
            } else {
                contentViewHeightConstraint?.constant = -(contentInset.top + contentInset.bottom)
                contentView.setNeedsLayout()
            }
        }
    }
    
    // MARK: - Methods
    public init(scrollableAxis: NSLayoutConstraint.Axis, contentInset: UIEdgeInsets = .zero) {
        self.scrollableAxis = scrollableAxis
        super.init(frame: .zero)
        self.contentInset = contentInset
        commonInit()
    }
    
    convenience init(
        scrollableAxis: NSLayoutConstraint.Axis,
        contentInset: UIEdgeInsets = .zero,
        spacing: CGFloat = 8,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill,
        @BEViewBuilder builder: Builder
    ) {
        self.init(scrollableAxis: scrollableAxis, contentInset: contentInset)
        let stackView = UIStackView(axis: scrollableAxis, spacing: spacing, alignment: alignment, distribution: distribution, arrangedSubviews: builder())
        contentView.addSubview(stackView)
        stackView.autoPinEdgesToSuperviewEdges()
    }
    
    @available(*, unavailable,
    message: "Loading this view from a nib is unsupported in favor of initializer dependency injection."
    )
    public required init?(coder: NSCoder) {
        fatalError("Loading this view from a nib is unsupported in favor of initializer dependency injection.")
    }
    
    func commonInit() {
        configureForAutoLayout()
        addSubview(contentView)
        contentView.autoPinEdgesToSuperviewEdges()
        if scrollableAxis == .vertical {
            contentViewWidthConstraint = contentView.widthAnchor.constraint(equalTo: widthAnchor, constant: -(contentInset.left + contentInset.right))
            contentViewWidthConstraint?.isActive = true
        } else {
            contentViewHeightConstraint = contentView.heightAnchor.constraint(equalTo: heightAnchor, constant: -(contentInset.top + contentInset.bottom))
            contentViewHeightConstraint?.isActive = true
        }
    }
}

extension ContentHuggingScrollView {
    public override func fittingHeight(targetWidth: CGFloat) -> CGFloat {
        contentInset.top
            + contentView.fittingHeight(targetWidth: targetWidth - contentInset.left - contentInset.right)
            + contentInset.bottom
    }
}
