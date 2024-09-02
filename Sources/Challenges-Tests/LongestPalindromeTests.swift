import XCTest
@testable import Challenges

final class LongestPalindromeTests: XCTestCase {
    let stu = LongestPalindrome()
    func testOne() {
        XCTAssertEqual(stu.longestPalindrome("babad"), "bab")
    }
    
    func testTwo() {
        XCTAssertEqual(stu.longestPalindrome("cbbd"), "bb")
    }
    
    func testThree() {
        XCTAssertEqual(stu.longestPalindrome("abb"), "bb")
    }
    
    func testFour() {
        XCTAssertEqual(stu.longestPalindrome("eabcb"), "bcb")
    }
}
