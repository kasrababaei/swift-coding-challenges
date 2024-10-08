import Testing
@testable import Challenges

struct OrderManagerTests {
  @Test func one() async throws {
    let orders = [
      Order(identifier: "SNAP"),
      Order(identifier: "GOOG"),
      Order(identifier: "HOOD"),
      Order(identifier: "AAPL"),
      Order(identifier: "TTYL"),
      Order(identifier: "OOPL"),
      Order(identifier: "PLBB"),
      Order(identifier: "FALL")
    ]
        
    var receivedOrders: [Order] = [orders[0]]
    var currentOrder = orders[0]
        
    NetworkManager.shared.didReceiveOrder = { order in
      if order != currentOrder {
        receivedOrders.append(order)
        currentOrder = order
      }
    }
        
        
    for order in orders {
      OrderManager.shared.placeOrder(order)
    }
        
    try await Task.polling(timeout: .seconds(orders.count)) {
      receivedOrders.count == orders.count
    }
        
    let expectation = orders.map(\.identifier).joined(separator: " -> ")
    let outcome = receivedOrders.map(\.identifier).joined(separator: " -> ")
    #expect(expectation == outcome)
  }
}

extension Task where Success == Never, Failure == Never {
  static func polling(
    timeout: Duration = .seconds(1),
    expectation: @escaping () -> Bool
  ) async throws {
    var now = Duration.zero
        
    while now < timeout {
      if expectation() {
        return
      } else {
        try await Task.sleep(for: .milliseconds(1))
        now = now + Duration.milliseconds(1)
      }
    }
  }
}
