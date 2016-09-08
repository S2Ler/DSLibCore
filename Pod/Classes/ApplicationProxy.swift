//
//  ApplicationProxy.swift
//  Pods
//
//  Created by Alexander Belyavskiy on 4/18/16.
//
//

import Foundation

/// A protocol for UIApplication. 
/// It was created to abstract UIApplication class which isn't available in extensions from frameworks which uses UIApplication interface.
@objc public protocol ApplicationProxy {
  func openURL(_ url: URL) -> Bool
  var keyWindow: UIWindow? { get }
  func beginIgnoringInteractionEvents()
  func endIgnoringInteractionEvents()
  func isIgnoringInteractionEvents() -> Bool
  func beginBackgroundTaskWithExpirationHandler(_ handler: (() -> Void)?) -> UIBackgroundTaskIdentifier
  func beginBackgroundTaskWithName(_ taskName: String?, expirationHandler handler: (() -> Void)?) -> UIBackgroundTaskIdentifier
  func endBackgroundTask(_ identifier: UIBackgroundTaskIdentifier)
}
