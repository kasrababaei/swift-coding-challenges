import XCTest
@testable import grind75

final class MinimumAddToMakeParenthesesValidTests: XCTestCase {
    func testOne() {
        let result = MinimumAddToMakeParenthesesValid().minAddToMakeValid("())")
        XCTAssertEqual(result, 1)
    }
    
    func testTwo() {
        let result = MinimumAddToMakeParenthesesValid().minAddToMakeValid("(((")
        XCTAssertEqual(result, 3)
    }
    
    func testThree() {
        let result = MinimumAddToMakeParenthesesValid().minAddToMakeValid(")(())")
        XCTAssertEqual(result, 1)
    }
    
    func testFour() {
        let result = MinimumAddToMakeParenthesesValid().minAddToMakeValid("()))((")
        XCTAssertEqual(result, 4)
    }
}
