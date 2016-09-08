//
//  Threading.swift
//  Pods
//
//  Created by Alexander Belyavskiy on 4/9/16.
//
//

import Foundation

/// Submit `closure` to main dispatch queue after `delayInSeconds`
public func delay(_ interval: TimeInterval, closure: @escaping () -> Void) {
  delay(interval, queue: DispatchQueue.main, closure: closure)
}

/// Submit `closure` to `queue` after `delayInSeconds`
public func delay(_ interval: TimeInterval, queue: DispatchQueue, closure: @escaping () -> Void) {
  let time = DispatchTime.now() + Double(Int64(interval * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
  queue.asyncAfter(deadline: time, execute: closure)
}

public extension DispatchQueue {
  /// Submit `closure` to this queue after `delayInSeconds`
  public func delay(_ interval: TimeInterval, closure: @escaping () -> Void) {
    DSLibCore.delay(interval, queue: self, closure: closure)
  }

  public func delay(_ dispatchTimeInterval: DispatchTimeInterval, closure: @escaping () -> Void) {
    let time = DispatchTime.now() + dispatchTimeInterval
    asyncAfter(deadline: time, execute: closure)
  }
}
