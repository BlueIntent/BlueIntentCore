//
//  BlueIntentCompatible.swift
//  BlueIntentCore_Example
//
//  Created by zhifei qiu on 2021/6/20.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation

public protocol BlueIntentCompatible {
  associatedtype BlueIntentCompatibleType
  
  var bi: BlueIntentCompatibleType { get }
  
  static var bi: BlueIntentCompatibleType.Type { get }
}

public extension BlueIntentCompatible {
  var bi: BlueIntentExtension<Self> {
    return BlueIntentExtension(self)
  }
  
  static var bi: BlueIntentExtension<Self>.Type {
    return BlueIntentExtension<Self>.self
  }
}

public class BlueIntentExtension<Base> {
  public let base: Base
  
  init(_ base: Base) {
    self.base = base
  }
}

/// Extend NSObject with `bi` proxy.
extension NSObject: BlueIntentCompatible { }

/// Extend String with `bi` proxy.
extension String: BlueIntentCompatible { }

/// Extend CGRect with `bi` proxy.
import CoreGraphics
extension CGRect: BlueIntentCompatible { }

/// Extend Optional with `bi` proxy.
public extension Optional {
  var bi: BlueIntentExtension<Self> {
    return BlueIntentExtension(self)
  }

  static var bi: BlueIntentExtension<Self>.Type {
    return BlueIntentExtension<Self>.self
  }
}
