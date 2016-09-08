//
//  Error.swift
//  Pods
//
//  Created by Alexander Belyavskiy on 12/1/15.
//
//

import Foundation

public protocol From {
  static func from<T>(_ value: T) -> Self
}

public protocol RustError: From, Swift.Error {
  
}

public func tryResult<T, E2: RustError>(_ this: () throws -> (T)) -> Result<T, E2> {
  do {
    let value = try this()
    return .ok(value)
  } catch {
    return .err(E2.from(error))
  }
}

public func tryResult<T, E1: RustError, E2: RustError>(_ this: @autoclosure () -> (Result<T, E1>)) -> Result<T, E2>{
  switch this() {
  case .ok(let value):
    return .ok(value)
  case .err(let error):
    return .err(E2.from(error))
  }
}
