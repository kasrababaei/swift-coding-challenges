import XCTest
@testable import Challenges

final class StringCompressionTests: XCTestCase {
    func testOne() {
        XCTAssertEqual(StringCompression.stringCompression("aabcccccaaa"), "a2b1c5a3")
    }
    
    func testTwo() {
        XCTAssertEqual(StringCompression.stringCompression("aAAAbbbbBB"), "a1A3b4B2")
    }
    
    func testThree() {
        XCTAssertEqual(StringCompression.stringCompression("abc"), "abc")
    }
    
    func testFour() {
        XCTAssertEqual(StringCompression.stringCompression("a"), "a")
    }
    
    func testFive() {
        XCTAssertEqual(StringCompression.stringCompression(""), "")
    }
}
