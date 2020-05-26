# BEPureLayout

[![CI Status](https://img.shields.io/travis/bigearsenal/BEPureLayout.svg?style=flat)](https://travis-ci.org/bigearsenal/BEPureLayout)
[![Version](https://img.shields.io/cocoapods/v/BEPureLayout.svg?style=flat)](https://cocoapods.org/pods/BEPureLayout)
[![License](https://img.shields.io/cocoapods/l/BEPureLayout.svg?style=flat)](https://cocoapods.org/pods/BEPureLayout)
[![Platform](https://img.shields.io/cocoapods/p/BEPureLayout.svg?style=flat)](https://cocoapods.org/pods/BEPureLayout)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- [PureLayout](https://github.com/PureLayout/PureLayout)

## Installation

BEPureLayout is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'BEPureLayout'
```
## Usage

BEPureLayout adds some short-hand helper-functions to well-known PureLayout library that helps developers quickly create common UIComponents like pure UIView, UIButton, UILabel, UIImageView,... Besides, this library add some common-used methods for adding constraints.

### UIView
```
init(width:, height:, backgroundColor:, cornerRadius:)
```
### UIButton
```
init(width:, height:, backgroundColor:, cornerRadius:, label:, labelFont:, textColor:, contentInsets:)
```
### UILabel
```
init(text:, textSize:, weight:, textColor:, numberOfLines:, textAlignment:)
```
### UIImageView
```
init(width:, height:, backgroundColor:, cornerRadius:, imageNamed:, contentMode:)
```
### UITextView
```
init(width:, height:, backgroundColor:, cornerRadius:, font:, keyboardType:, placeholder:, autocorrectionType:, autocapitalizationType:, spellCheckingType:, textContentType:, isSecureTextEntry:, horizontalPadding:, leftView:, leftViewMode:, rightView:, rightViewMode:)
```
Note: only provide known properties. For example, if the view's width is relative to superview's width, then just remove the width property from the initializer: `UIView(height: 30)`

### New methods for adding constraint
- autoPinToTopLeftCornerOfSuperview
- autoPinToTopRightCornerOfSuperview
- autoPinToBottomLeftCornerOfSuperview
- autoPinToBottomRightCornerOfSuperview
- autoPinToTopLeftCornerOfSuperviewSafeArea
- autoPinToTopRightCornerOfSuperviewSafeArea
- autoPinToBottomLeftCornerOfSuperviewSafeArea
- autoPinToBottomRightCornerOfSuperviewSafeArea
- autoPinBottomToSuperViewSafeAreaAvoidKeyboard

## Author

bigearsenal, bigearsenal@gmail.com

## License

BEPureLayout is available under the MIT license. See the LICENSE file for more info.
