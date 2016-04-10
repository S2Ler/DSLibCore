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

public extension SequenceType {
  public func firstThat<QueryType>(@noescape predicate: (Generator.Element) -> QueryType?) -> QueryType? {
    for element in self {
      if let t = predicate(element) {
        return t
      }
    }
    
    return nil
  }
  
  public func firstThat(@noescape predicate: (Generator.Element) -> Bool) -> Generator.Element? {
    for element in self {
      if predicate(element) {
        return element
      }
    }
    
    return nil
  }
  
  public func lastThat(@noescape predicate: (Generator.Element) -> Bool) -> Generator.Element? {
    var last: Generator.Element? = nil
    for element in self {
      if predicate(element) {
        last = element
      }
    }
    
    return last
  }
  
  public func apply<T>(function: (Generator.Element) -> T) -> [T] {
    return map { function($0) }
  }
  
  public func apply(function: (Generator.Element) -> Void) {
    forEach { function($0) }
  }

}