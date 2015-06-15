//
//  Array+DSExtensions.swift
//  Pods
//
//  Created by Alexander Belyavskiy on 6/15/15.
//
//

public func each<T>(array: Array<T>, block: (T) -> Void) {
  for obj in array {
    block(obj)
  }
}