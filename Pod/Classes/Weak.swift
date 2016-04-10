//
//  Weak.swift
//  Pods
//
//  Created by Alexander Belyavskiy on 4/10/16.
//
//

import Foundation

public class Weak<T: AnyObject> {
  public weak var value : T?
  public init (value: T) {
    self.value = value
  }
}