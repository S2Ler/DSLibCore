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

}