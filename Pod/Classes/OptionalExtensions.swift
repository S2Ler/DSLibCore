//
//  OptionalExtensions.swift
//  Pods
//
//  Created by Alexander Belyavskiy on 12/1/15.
//
//

import Foundation

public extension Optional {
  typealias S = (Wrapped) -> (Int?)
  public func andThen<U>(f: (Wrapped) -> U?) -> U? {
    switch self {
    case .Some(let x):
      return f(x)
    case .None:
      return nil
    }
  }
}