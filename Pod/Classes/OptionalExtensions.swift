//
//  OptionalExtensions.swift
//  Pods
//
//  Created by Alexander Belyavskiy on 12/1/15.
//
//

import Foundation

public extension Optional {
  public func andThen<U>(f: (Wrapped) throws -> U?) rethrows -> U? {
    switch self {
    case .some(let x):
      return try f(x)
    case .none:
      return nil
    }
  }
  
  public func apply(f: (Wrapped) throws -> ()) rethrows {
    switch self {
    case .some(let x):
      try f(x)
    case .none:
      break
    }
  }
}
