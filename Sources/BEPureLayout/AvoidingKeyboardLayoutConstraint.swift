// The MIT License (MIT)
//
// Copyright (c) 2015 James Tang (j@jamztang.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
import UIKit

#if !os(tvOS)
@available(tvOS, unavailable)
public class AvoidingKeyboardLayoutConstraint: NSLayoutConstraint {
    
    private var offset: CGFloat = 0

    public func observeKeyboardHeight() {
        offset = constant
        
        NotificationCenter.default.addObserver(self, selector: #selector(AvoidingKeyboardLayoutConstraint.keyboardWillShowNotification(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(AvoidingKeyboardLayoutConstraint.keyboardWillHideNotification(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @available(tvOS, unavailable)
    override public func awakeFromNib() {
        super.awakeFromNib()
        observeKeyboardHeight()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: Notification
    
    @objc func keyboardWillShowNotification(_ notification: Notification) {
        guard let keyboardSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }

        updateConstraintOnKeyboardWillShow(height: keyboardSize.cgRectValue.height)

        if let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber,
           let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber
        {
            let options = UIView.AnimationOptions(rawValue: curve.uintValue)
            
            UIView.animate(
                withDuration: TimeInterval(duration.doubleValue),
                delay: 0,
                options: options,
                animations: {
                    UIApplication.shared.keyWindow?.layoutIfNeeded()
                    return
            }, completion: { _ in
            })
        }
    }
    
    @objc func keyboardWillHideNotification(_ notification: NSNotification) {
        self.updateConstraintOnKeyboardWillHide()
        
        if let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber,
           let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber
        {
            let options = UIView.AnimationOptions(rawValue: curve.uintValue)
            
            UIView.animate(
                withDuration: TimeInterval(duration.doubleValue),
                delay: 0,
                options: options,
                animations: {
                    UIApplication.shared.keyWindow?.layoutIfNeeded()
                    return
                }
            )
        }
    }

    func updateConstraintOnKeyboardWillHide() {
        constant = offset
    }

    func updateConstraintOnKeyboardWillShow(height: CGFloat) {
        guard let secondItem = secondItem as? UIView else {
            return constant = offset + height
        }

        var root = findKeyboardRoot(in: secondItem.superview)

        if
            let bottomPoint = secondItem.superview?.convert(secondItem.frame, to: root).maxY,
            let windowHeight = secondItem.window?.frame.height
        {
            let requiredBottomPoint = windowHeight - (height + offset)
            constant += bottomPoint - requiredBottomPoint
        } else {
            constant = offset + height
        }
    }

    private func findKeyboardRoot(in view: UIView?) -> UIView? {
        // UIDropShadowSiew while pageSheet transition has transformation
        if view == nil || view is UIWindow || view?.transform != .identity {
            return view
        }

        return findKeyboardRoot(in: view?.superview)
    }
}
#endif

