//
//  Lazy.swift
//  Pods
//
//  Created by Alexander Belyavskiy on 12/7/15.
//
//

import Foundation

public final class LazyObject<ObjectType, OwnerType> {
  private let owner: () -> (OwnerType)
  private let setupBlock: (OwnerType) -> (ObjectType)
  private lazy var _object: ObjectType! = {
    return self.setupBlock(self.owner())
  }()
  
  public init(owner: () -> (OwnerType), setupBlock: (OwnerType) -> (ObjectType)) {
    self.owner = owner
    self.setupBlock = setupBlock
  }
  
  public var object: ObjectType {
    return _object
  }
  
  public func load() -> ObjectType {
    return _object
  }
  
  public func unload() {
    _object = nil
  }
}