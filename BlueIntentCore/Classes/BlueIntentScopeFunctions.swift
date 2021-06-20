//
//  BlueIntentScopeFunctions.swift
//  BlueIntentCore_Example
//
//  Created by zhifei qiu on 2021/6/20.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation

// 作用域函数,参照 kotlin https://www.kotlincn.net/docs/reference/scope-functions.html

extension Optional {
  // unwrap, return self
  @discardableResult
  public func `let`(_ block: ((_ it: Wrapped) -> Void)?) -> Self {
    if let block = block, let it = self {
      block(it)
    }
    return self
  }
  
  // unwrap, with default value, return wrapped
  @discardableResult
  public func `let`(_ default: (() -> Wrapped), `let`: ((_ it: Wrapped) -> Void)?) -> Wrapped {
    let it = self ?? `default`()
    `let`?(it)
    return it
  }
  
  // value scope, return new value
  @discardableResult
  public func `var`<T>(_ block: ((_ it: Wrapped?) -> T?)) -> T? {
    return block(self)
  }
}

extension BlueIntentExtension {
  @discardableResult
  public func `let`(_ block: ((_ it: Base) -> Void)?) -> Self {
    block?(base)
    return self
  }
  
  @discardableResult
  public func `var`<T>(_ block: ((_ it: Base?) -> T?)) -> T? {
    return block(base)
  }
}
