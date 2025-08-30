import Foundation

protocol KBNotificationCenter: AnyObject, Sendable {
  static var `default`: KBNotificationCenter { get }
  
  func addObserver(
    forName name: KBNotification.Name?,
    object obj: Any?,
    queue: OperationQueue?,
    using block: @escaping @Sendable (KBNotification) -> Void
  ) -> any NSObjectProtocol
  func removeObserver(_ observer: Any, name aName: KBNotification.Name?, object anObject: Any?)
  func post(name aName: KBNotification.Name, object anObject: Any?)
}

extension KBNotificationCenter {
  static var `default`: any KBNotificationCenter { DefaultKBNotificationCenter.default }
}

final class DefaultKBNotificationCenter: KBNotificationCenter, @unchecked Sendable {
  static let `default` = DefaultKBNotificationCenter()
  private let lock = NSLock()
  private let defaultName = KBNotification.Name("KBNotificationCenter.KBNotificationName.Name.Nil")
  private var dict: [KBNotification.Name: [KBNotificationObserver: KBNotification]] = [:]
  
  func addObserver(
    forName name: KBNotification.Name?,
    object obj: Any?,
    queue: OperationQueue?,
    using block: @escaping @Sendable (KBNotification) -> Void
  ) -> any NSObjectProtocol {
    let notification = KBNotification(name: name, object: obj, block: block)
    let observer = KBNotificationObserver(notification)
    dict[notification.name ?? defaultName, default: [:]][observer] = notification
    
    return observer
  }
  
  func removeObserver(_ observer: Any, name aName: KBNotification.Name?, object anObject: Any?) {
    lock.withLock {
      if let name = aName, let _dict = dict[name] {
        for key in _dict.keys {
          if key === observer as AnyObject {
            dict[name]?.removeValue(forKey: key)
          }
        }
      }
    }
  }
  
  func post(name aName: KBNotification.Name, object anObject: Any? = nil) {
    lock.withLock {
      if let _dict = dict[aName] {
        for (observer, notification) in _dict {
          if notification.object == nil {
            dict[aName]?.removeValue(forKey: observer)
          } else {
            notification.block(notification)
          }
        }
      }
    }
  }
}

final class KBNotification {
  let name: KBNotification.Name?
  weak var object: AnyObject?
  let block: @Sendable (KBNotification) -> Void
  
  init(name: KBNotification.Name?, object: Any?, block: @escaping @Sendable (KBNotification) -> Void) {
    self.name = name
    self.object = object as AnyObject
    self.block = block
  }
}

extension KBNotification {
  struct Name: ExpressibleByStringLiteral, Hashable {
    let name: String
    
    init(stringLiteral value: String) {
      self.name = value
    }
  }
}

private final class KBNotificationObserver: NSObject {
  let id = UUID()
  weak var notification: KBNotification?
  
  init(_ notification: KBNotification) {
    self.notification = notification
  }
}
