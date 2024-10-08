import XCTest
@testable import Challenges

final class MovingAverageTests: XCTestCase {
  func testFirst() {
    let movingAverage = MovingAverage(3)
    let output = [1, 10, 3, 5, 1, 10, 3, 5].map { movingAverage.next($0) }
    let expectation = [1.00000, 5.50000, 4.66667, 6.00000, 3.00000, 5.33333, 4.66667, 6.00000]
        
    for (first, second) in zip(output, expectation) {
      XCTAssertEqual(first, second, accuracy: 5)
    }
  }
}
