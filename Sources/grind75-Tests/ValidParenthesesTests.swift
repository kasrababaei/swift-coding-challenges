import XCTest
@testable import grind75

final class ValidParenthesesTests: XCTestCase {
    func test() {
        XCTAssertEqual(ValidParentheses.isValid("()"), true)
        XCTAssertEqual(ValidParentheses.isValid("()[]{}"), true)
        XCTAssertEqual(ValidParentheses.isValid("(]"), false)
        XCTAssertEqual(ValidParentheses.isValid("{[]}"), true)
        XCTAssertEqual(ValidParentheses.isValid("([)]"), false)
        XCTAssertEqual(ValidParentheses.isValid("){"), false)
    }
}
