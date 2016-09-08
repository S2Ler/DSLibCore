//
//  Array+DSExtensions.swift
//  Pods
//
//  Created by Alexander Belyavskiy on 6/15/15.
//
//

public func each<T>(_ array: Array<T>, block: (T) -> Void) {
  for obj in array {
    block(obj)
  }
}

public extension Sequence {
  public func firstThat<QueryType>(_ predicate: (Iterator.Element) -> QueryType?) -> QueryType? {
    for element in self {
      if let t = predicate(element) {
        return t
      }
    }
    
    return nil
  }
  
  public func firstThat(_ predicate: (Iterator.Element) -> Bool) -> Iterator.Element? {
    for element in self {
      if predicate(element) {
        return element
      }
    }
    
    return nil
  }
  
  public func lastThat(_ predicate: (Iterator.Element) -> Bool) -> Iterator.Element? {
    var last: Iterator.Element? = nil
    for element in self {
      if predicate(element) {
        last = element
      }
    }
    
    return last
  }
  
  public func apply<T>(_ function: (Iterator.Element) -> T) -> [T] {
    return map { function($0) }
  }
  
  public func apply(_ function: (Iterator.Element) -> Void) {
    forEach { function($0) }
  }

}
