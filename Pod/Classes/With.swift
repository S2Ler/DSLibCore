//
//  With.swift
//  Pods
//
//  Created by Alexander Belyavskiy on 4/27/16.
//
//

import Foundation

public func with<T>(_ object: T, do: (T) -> T) -> T {
  return `do`(object)
}
