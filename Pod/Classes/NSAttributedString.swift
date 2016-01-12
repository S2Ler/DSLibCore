//
//  NSAttributedString.swift
//  Pods
//
//  Created by Alexander Belyavskiy on 1/12/16.
//
//

import Foundation

public extension NSAttributedString {
  public var fullRange: NSRange {
    return NSMakeRange(0, self.length)
  }
}