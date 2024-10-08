/*
 The placeOrder(_:) method on OrderManager, receives Orders that are then sent to NetworkManager.
 The asynchronous `sendOrder(order:success:failure:)` call returns either success or failure.
 
 Update placeOrder(_:) so orders are processed by a FIFO queue. If an order fails, retry two more
 times (three tries in total) before trying the next order.
 
 Example:
 Lets say `placeOrder(_:)` is called like:
     OrderManager.shared.placeOrder(Order(identifier: "SNAP"))
     OrderManager.shared.placeOrder(Order(identifier: "GOOG"))
     OrderManager.shared.placeOrder(Order(identifier: "HOOD"))
     OrderManager.shared.placeOrder(Order(identifier: "AAPL"))
 
 Then the output should be similar to this:
     sendingOrder: "SNAP"
     success: "SNAP"
     sendingOrder: "GOOG"
     success: "GOOG"
     sendingOrder: "HOOD"
     failure: "HOOD"
     sendingOrder: "HOOD"
     success: "HOOD"
     sendingOrder: "AAPL"
     success: "AAPL"
 
 Whether an order succeeds or fails is a random event but orders are processed in such order:
    IN: SNAP, GOOG, HOOD, AAPL
    OUT: SNAP, GOOD, HOOD, APPL
 */

import Foundation

// DO NOT CHANGE THE EDIT THIS TYPE
class NetworkManager: @unchecked Sendable {
  static let shared = NetworkManager()
    
  /// THIS CLOSURE IS ONLY FOR TESTING
  var didReceiveOrder: ((Order) -> Void)?
    
  func sendOrder(
    order: Order,
    success: @Sendable @escaping () -> Void,
    failure: @Sendable @escaping () -> Void
  ) {
    didReceiveOrder?(order)
    let requestDuration = Double.random(in: 0...0.3)
        
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + requestDuration) {
      let rand = Int.random(in: 0...1)
      if rand == 0 {
        print("success: \(order.identifier)")
        success()
      } else {
        print("failure: \(order.identifier)")
        failure()
      }
    }
  }
}

// DO NOT CHANGE THE EDIT THIS TYPE
struct Order: Equatable {
  let identifier: String
}
 
final class OrderManager: @unchecked Sendable {
  static let shared = OrderManager()
  private init() {}
    
  // CAN DEFINE INSTANCE PROPERTIES AND METHODS
  private var head: ListNode? = nil
  private var tail: ListNode? = nil
  private let semaphore = DispatchSemaphore(value: 1)
    
  // DO NOT CHANGE THE SIGNATURE OF THIS METHOD BUT CAN CHANGE THE IMPLEMENTATION
  func placeOrder(_ order: Order) {
    if head == nil {
      head = ListNode(order)
      tail = head
    } else {
      tail?.next = ListNode(order)
      tail = tail?.next
    }
        
    processOrders()
  }
    
  private func processOrders() {
    DispatchQueue.global().async { [weak self] in
      self?.semaphore.wait()
            
      if let order = self?.head?.value {
        self?.sendOrder(order)
        self?.head = self?.head?.next
      }
    }
  }
    
  private func sendOrder(_ order: Order, tryCount: Int = 0) {
    guard tryCount < 3 else {
      finishedProcessingOrder(order)
      return
    }
        
    NetworkManager.shared.sendOrder(
      order: order,
      success: { [weak self] in self?.finishedProcessingOrder(order) },
      failure: { [weak self] in self?.sendOrder(order, tryCount: tryCount + 1) }
    )
  }
    
  private func finishedProcessingOrder(_ order: Order) {
    semaphore.signal()
    processOrders()
  }
}

extension OrderManager {
  final class ListNode: @unchecked Sendable {
    var value: Order?
    var next: ListNode?
        
    init(_ value: Order? = nil, _ next: ListNode? = nil) {
      self.value = value
      self.next = next
    }
  }
}
