//
//  BEScrollView.swift
//  BEPureLayout
//
//  Created by Giang Long Tran on 09.12.21.
//

import Foundation

public class BEScrollView: BEView {
    public let scrollView: ContentHuggingScrollView
    private let stackView: UIStackView
    var scrollViewBottomConstraint: NSLayoutConstraint!
    
    public init(
        axis: NSLayoutConstraint.Axis = .vertical,
        contentInsets: UIEdgeInsets? = nil,
        spacing: CGFloat? = nil,
        alwaysBounceVertical: Bool = false,
        refreshControl: UIRefreshControl? = nil,
        isPagingEnabled: Bool = false,
        showsHorizontalScrollIndicator: Bool = true,
        delegate: UIScrollViewDelegate? = nil,
        @BEViewBuilder builder: Builder
    ) {
        scrollView = ContentHuggingScrollView(scrollableAxis: axis, contentInset: contentInsets ?? .zero)
        stackView = UIStackView(axis: .vertical, spacing: spacing, alignment: .fill, distribution: .fill, arrangedSubviews: builder())
        super.init(frame: .zero)
        
        scrollView.refreshControl = refreshControl
        scrollView.alwaysBounceVertical = alwaysBounceVertical
        scrollView.isPagingEnabled = isPagingEnabled
        scrollView.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
        scrollView.delegate = delegate
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
