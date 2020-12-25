//
//  BESearchBar.swift
//  BEPureLayout
//
//  Created by Chung Tran on 25/12/2020.
//

import Foundation

public protocol BESearchBarDelegate: class {
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
    private let magnifyingIconSize: CGFloat = 14
    // MARK: - Properties
    public var placeholder = NSLocalizedString("Search", comment: "") {
        didSet { textField.placeholder = placeholder }
    }
    public var textFieldBgColor = UIColor.clear {
        didSet { textField.backgroundColor = textFieldBgColor }
    }
    public weak var delegate: BESearchBarDelegate?
    public lazy var magnifyingIconImageView: UIImageView = {
        let bundle = Bundle(for: self.classForCoder)
        let image = UIImage(named: "search", in: bundle, compatibleWith: nil)
        let imageView = UIImageView(width: magnifyingIconSize, height: magnifyingIconSize, image: image)
        return imageView
    }()
    
    // MARK: - Subviews
    private lazy var stackView = UIStackView(axis: .horizontal, spacing: 10, alignment: .fill, distribution: .fill)
    
    private lazy var textField: UITextField = {
        let textField = UITextField(backgroundColor: textFieldBgColor, placeholder: placeholder, showClearButton: true)
        
        // textField's leftView
        let leftView = UIView(width: 34, height: magnifyingIconSize)
        
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
    public init() {
        super.init(frame: .zero)
        configureForAutoLayout()
        autoSetDimension(.height, toSize: 35)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func commonInit() {
        super.commonInit()
        stackView.addArrangedSubviews([textField, cancelButton])
        
        addSubview(stackView)
        stackView.autoPinEdgesToSuperviewEdges()
        
        cancelButton.isHidden = true
        
        textField.delegate = self
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        if frame.height > 0 {
            textField.layer.cornerRadius = frame.height / 2
            textField.layer.masksToBounds = true
        }
    }
    
    fileprivate func showCancelButton(_ show: Bool = true) {
        if cancelButton.isHidden != show {return}
        cancelButton.isHidden = !show
        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1, options: [], animations: {
            self.stackView.layoutIfNeeded()
        }, completion: nil)
    }
    
    open func clear() {
        textField.text = ""
        textField.sendActions(for: .editingChanged)
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
    
    @objc private func triggerSearch() {
        delegate?.beSearchBar(self, searchWithKeyword: textField.text ?? "")
    }
}

extension BESearchBar: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        showCancelButton()
        delegate?.beSearchBarDidBeginSearching(self)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        showCancelButton(false)
        delegate?.beSearchBarDidEndSearching(self)
    }
}

