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

BEPureLayout adds some custom UI classes, short-hand helper-functions to well-known PureLayout library that helps developers quickly create common UIComponents like pure UIView, UIButton, UILabel, UIImageView,... Besides, this library add some common-used methods for adding constraints.

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
Note: You don't have to provide all properties to initializers. Only provide known or required properties, then other properties will be set by default. For example, if the view's width is based on superview's width, then just remove the width property from the initializer: `UIView(height: 30)` and add needed width constraint to superview

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

### ContentHuggingScrollView
This subclass of UIScrollView contains a `contentView` that is hugged inside ScrollView itself and only scrollable in a defined direction provided by property `scrollableAxis`.
Everything that needs to add to ScrollView should be added only to its `contentView`.
For example:
```
let scrollView = ContentHuggingScrollView(scrollableAxis: .vertical)
view.addSubview(scrollView)
scrollView.autoPinEdgesToSuperviewEdges()

let label = UILabel(text: "Very long text.....")

scrollView.contentView.addSubview(label)
label.autoPinEdgesToSuperviewEdges()
```
For more detail, see Example project

## Author

bigearsenal, bigearsenal@gmail.com

## License

BEPureLayout is available under the MIT license. See the LICENSE file for more info.
