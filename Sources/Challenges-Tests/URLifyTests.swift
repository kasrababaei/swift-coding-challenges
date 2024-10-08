import XCTest
@testable import Challenges

final class URLifyTests: XCTestCase {
  func testURLify() {
    XCTAssertEqual(URLify.urlify("Mr John Smith ", 13), "Mr%20John%20Smith")
    XCTAssertEqual(URLify.urlify("Hello World ", 11), "Hello%20World")
    XCTAssertEqual(URLify.urlify("A B C ", 5), "A%20B%20C")
    XCTAssertEqual(URLify.urlify(" LeadingSpaces ", 12), "LeadingSpaces")
    XCTAssertEqual(URLify.urlify("TrailingSpaces ", 14), "TrailingSpaces")
    XCTAssertEqual(URLify.urlify("NoSpaces", 8), "NoSpaces")
  }
}
