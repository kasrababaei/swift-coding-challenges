import XCTest
@testable import Challenges

final class AddTwoNumbersTests: XCTestCase {
  func testOne() {
    let result = AddTwoNumbers.addTwoNumbers(ListNode([2, 4, 3]), ListNode([5, 6, 4]))
    XCTAssertEqual(result?.flatten(), [7, 0, 8])
  }
    
  func testTwo() {
    let result = AddTwoNumbers.addTwoNumbers(ListNode([0]), ListNode([0]))
    XCTAssertEqual(result?.flatten(), [0])
  }
    
  func testThree() {
    let result = AddTwoNumbers.addTwoNumbers(ListNode([9, 9, 9, 9, 9, 9, 9]), ListNode([9, 9, 9, 9]))
    XCTAssertEqual(result?.flatten(), [8, 9, 9, 9, 0, 0, 0, 1])
  }
    
  func testFour() {
    let result = AddTwoNumbers.addTwoNumbers(ListNode([2, 4, 9]), ListNode([5, 6, 4, 9]))
    XCTAssertEqual(result?.flatten(), [7, 0, 4, 0, 1])
  }
    
  func testFive() {
    let result = AddTwoNumbers.addTwoNumbers(
      ListNode([1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]),
      ListNode([5, 6, 4])
    )
    XCTAssertEqual(
      result?.flatten(),
      [6, 6, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]
    )
  }
}
