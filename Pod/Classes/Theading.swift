//
//  Threading.swift
//  Pods
//
//  Created by Alexander Belyavskiy on 4/9/16.
//
//

import Foundation



/// Submit `closure` to main dispatch queue after `delayInSeconds`
public func delay(delayInSeconds: Double, closure: () -> Void) {
  delay(delayInSeconds, queue: dispatch_get_main_queue(), closure: closure)
}

/// Submit `closure` to `queue` after `delayInSeconds`
public func delay(delayInSeconds:Double, queue: dispatch_queue_t, closure:() -> Void) {
  let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delayInSeconds * Double(NSEC_PER_SEC)))
  dispatch_after(time, queue, closure)
}

public extension dispatch_queue_t {
  /// Submit `closure` to this queue after `delayInSeconds`
  public func delay(delayInSeconds: Double, closure: () -> Void) {
    DSLibCore.delay(delayInSeconds, queue: self, closure: closure)
  }
}
