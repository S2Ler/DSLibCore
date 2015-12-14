//
//  Numbers.swift
//  Pods
//
//  Created by Alexander Belyavskiy on 12/14/15.
//
//

import Foundation

public extension CGSize {
  public var integral: CGSize {
    return CGSize(width: ceil(width), height: ceil(height))
  }
}