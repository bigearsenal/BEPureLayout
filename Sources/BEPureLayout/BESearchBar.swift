//
//  BESearchBar.swift
//  BEPureLayout
//
//  Created by Chung Tran on 25/12/2020.
//

import Foundation

public protocol BESearchBarDelegate: AnyObject {
    func beSearchBar(_ searchBar: BESearchBar, searchWithKeyword keyword: String)
    func beSearchBarDidBeginSearching(_ searchBar: BESearchBar)
    func beSearchBarDidEndSearching(_ searchBar: BESearchBar)
    func beSearchBarDidCancelSearching(_ searchBar: BESearchBar)
}

extension BESearchBarDelegate where Self: UIViewController {
    func beSearchBarDidBeginSearching(_ searchBar: BESearchBar) {
        navigationController?.setNavigationBarHidden(true, animated: true)
        view.layoutIfNeeded()
    }
    
    func beSearchBarDidEndSearching(_ searchBar: BESearchBar) {
        navigationController?.setNavigationBarHidden(false, animated: true)
        view.layoutIfNeeded()
    }
    
    func beSearchBarDidCancelSearching(_ searchBar: BESearchBar) {
        searchBar.clear()
    }
}

open class BESearchBar: BEView {
    // MARK: - Properties
    public var placeholder = NSLocalizedString("Search", comment: "") {
        didSet { textField.placeholder = placeholder }
    }
    public var textFieldBgColor = UIColor.clear {
        didSet { textField.backgroundColor = textFieldBgColor }
    }
    public weak var delegate: BESearchBarDelegate?
    public lazy var magnifyingIconImageView: UIImageView = {
        let image = UIImage(named: "search", in: Bundle(for: Self.self), compatibleWith: nil)
        let imageView = UIImageView(width: magnifyingIconSize, height: magnifyingIconSize, image: image)
        return imageView
    }()
    public var magnifyingIconSize: CGFloat = 14 {
        didSet {
            magnifyingIconImageView.widthConstraint?.constant = magnifyingIconSize
            magnifyingIconImageView.heightConstraint?.constant = magnifyingIconSize
            magnifyingIconImageView.setNeedsLayout()
            textField.leftView?.layoutIfNeeded()
        }
    }
    
    public lazy var leftViewWidth: CGFloat = magnifyingIconSize + 20 {
        didSet {
            textField.leftView?.widthConstraint?.constant = leftViewWidth
            textField.leftView?.setNeedsLayout()
            textField.layoutIfNeeded()
        }
    }
    
    open override var tintColor: UIColor! {
        didSet {
            cancelButton.setTitleColor(tintColor, for: .normal)
        }
    }
    
    // MARK: - Subviews
    private lazy var stackView = UIStackView(axis: .horizontal, spacing: 10, alignment: .fill, distribution: .fill)
    
    private lazy var textField: UITextField = {
        let textField = UITextField(
            backgroundColor: textFieldBgColor,
            placeholder: placeholder,
            autocorrectionType: .no,
            autocapitalizationType: UITextAutocapitalizationType.none,
            spellCheckingType: .no,
            showClearButton: true
        )
        
        // textField's leftView
        let leftView = UIView(width: leftViewWidth, height: 0)
        
        leftView.addSubview(magnifyingIconImageView)
        magnifyingIconImageView.autoCenterInSuperview()
        
        textField.leftView = leftView
        textField.leftViewMode = .always
        
        return textField
    }()
    
    public lazy var cancelButton: UIButton = {
        let button = UIButton(label: NSLocalizedString("Cancel", comment: ""))
        button.setContentHuggingPriority(.required, for: .horizontal)
        button.setContentCompressionResistancePriority(.required, for: .horizontal)
        button.addTarget(self, action: #selector(cancelButtonDidTouch), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Initializers
    public init(fixedHeight: CGFloat, cornerRadius: CGFloat? = nil) {
        super.init(frame: .zero)
        configureForAutoLayout()
        autoSetDimension(.height, toSize: fixedHeight)
        defer {
            textField.layer.cornerRadius = cornerRadius ?? fixedHeight / 2
            textField.layer.masksToBounds = true
        }
    }
    
    open override func commonInit() {
        super.commonInit()
        stackView.addArrangedSubviews([textField, cancelButton])
        
        addSubview(stackView)
        stackView.autoPinEdgesToSuperviewEdges()
        
        cancelButton.isHidden = true
        
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        textField.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingDidEnd)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        if textField.leftView?.heightConstraint?.constant != self.bounds.height {
            textField.leftView?.heightConstraint?.constant = self.bounds.height
            textField.leftView?.setNeedsLayout()
            textField.layoutIfNeeded()
        }
    }

    open override func becomeFirstResponder() -> Bool {
        textField.becomeFirstResponder()
    }

    open override func resignFirstResponder() -> Bool {
        textField.resignFirstResponder()
    }

    fileprivate func showCancelButton(_ show: Bool = true) {
        if cancelButton.isHidden != show {return}
        cancelButton.isHidden = !show
        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1, options: [], animations: {
            self.stackView.layoutIfNeeded()
        }, completion: nil)
    }
    
    open func clear(notify: Bool = true) {
        textField.text = ""
        if notify {
            textField.sendActions(for: .editingChanged)
        }
    }
    
    public func setUpTextField(
        placeholderTextColor: UIColor? = nil,
        autocorrectionType: UITextAutocorrectionType? = nil,
        autocapitalizationType: UITextAutocapitalizationType? = nil,
        spellCheckingType: UITextSpellCheckingType? = nil,
        textContentType: UITextContentType? = nil
    ) {
        if let placeholderTextColor = placeholderTextColor {
            textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor: placeholderTextColor])
        }
        
        if let autocorrectionType = autocorrectionType {
            textField.autocorrectionType = autocorrectionType
        }
        if let autocapitalizationType = autocapitalizationType {
            textField.autocapitalizationType = autocapitalizationType
        }
        if let spellCheckingType = spellCheckingType {
            textField.spellCheckingType = spellCheckingType
        }
        
        if let textContentType = textContentType {
            textField.textContentType = textContentType
        }
    }
    
    // MARK: - Actions
    @objc private func cancelButtonDidTouch() {
        textField.resignFirstResponder()
        delegate?.beSearchBarDidCancelSearching(self)
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(triggerSearch), object: nil)
        perform(#selector(triggerSearch), with: nil, afterDelay: 0.3)
    }
    
    @objc private func textFieldDidBeginEditing(_ textField: UITextField) {
        showCancelButton()
        delegate?.beSearchBarDidBeginSearching(self)
    }
    
    @objc private func textFieldDidEndEditing(_ textField: UITextField) {
        showCancelButton(false)
        delegate?.beSearchBarDidEndSearching(self)
    }
    
    @objc private func triggerSearch() {
        delegate?.beSearchBar(self, searchWithKeyword: textField.text ?? "")
    }
}

