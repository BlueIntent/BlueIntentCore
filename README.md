# BlueIntentCore

[![CI Status](https://travis-ci.com/QiuZhiFei/BlueIntentCore.svg?branch=master)](https://travis-ci.com/qiuzhifei/BlueIntentCore)
[![Version](https://img.shields.io/cocoapods/v/BlueIntentCore.svg?style=flat)](https://cocoapods.org/pods/BlueIntentCore)
[![License](https://img.shields.io/cocoapods/l/BlueIntentCore)](https://github.com/qiuzhifei/BlueIntentCore/blob/master/LICENSE)
[![Platform](https://img.shields.io/cocoapods/p/BlueIntentCore.svg?style=flat)](https://cocoapods.org/pods/BlueIntentCore)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

BlueIntentCore is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'BlueIntentCore'
```

## Usage
```
import BlueIntentBase
```
unwrap optional value
```
let string: String? = "test"
    
// unwrap
string.let { it in
  // it is wrapped value
}

// unwrap, with default value
string = string.let {
  return "test"
} let: { it in
  // it is wrapped value
}

```
Use `BlueIntentExtension` proxy as customization point for constrained protocol extensions
```
extension String: BlueIntentCompatible { }

extension BlueIntentExtension where Base == String {
  public var length: Int {
    return base.count
  }
}

let string = "test"
string.bi.length

```
BlueIntentExtension & Unwrap
```
let string: String? = "test"
    
// unwrap
string?.bi.let { it in
// it is wrapped value
  XCTAssert(it == "test")
}
```

## Manually
```
make
```

## Author

qiuzhifei, qiuzhifei521@gmail.com

## References
- https://github.com/ReactiveX/RxSwift/blob/main/RxSwift/Reactive.swift
- https://developer.apple.com/documentation/swift/optional

## License

BlueIntentCore is available under the MIT license. See the LICENSE file for more info.

