//
//  NSAttributedString.swift
//  Pods
//
//  Created by Alexander Belyavskiy on 1/12/16.
//
//

import Foundation

public extension NSAttributedString {
  /// Return NSRange of the whole string
  public var fullRange: NSRange {
    return NSMakeRange(0, self.length)
  }
}