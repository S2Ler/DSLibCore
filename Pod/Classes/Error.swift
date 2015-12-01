//
//  Error.swift
//  Pods
//
//  Created by Alexander Belyavskiy on 12/1/15.
//
//

import Foundation

public protocol From {
  static func from<T>(value: T) -> Self
}

public protocol Error: From, ErrorType {
  
}

public func tryResult<T, E2: Error>(this: () throws -> (T)) -> Result<T, E2> {
  do {
    let value = try this()
    return .Ok(value)
  } catch {
    return .Err(E2.from(error))
  }
}

public func tryResult<T, E1: Error, E2: Error>(@autoclosure this: () -> (Result<T, E1>)) -> Result<T, E2>{
  switch this() {
  case .Ok(let value):
    return .Ok(value)
  case .Err(let error):
    return .Err(E2.from(error))
  }
}