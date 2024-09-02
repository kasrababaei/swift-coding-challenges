import XCTest
@testable import Challenges

final class PermutationStringsTests: XCTestCase {
    func testIsPermutation() {
        let strings = [
            ("abcd", "dcba"),
            ("12345", "54321"),
            ("apple", "papel"),
            ("!@ #", "@! #"),
            ("Hello ", "o lHel")
        ]
        
        for string in strings {
            XCTAssertTrue(PermutationStrings.isPermutation(string.0, string.1), "'\(string.0)' '\(string.1)'")
        }
    }
    
    func testIsNotPermutation() {
        let strings = [
            ("abcd", "abce"),
            ("12345", "1234"),
            ("apple", "pppale"),
            ("Hello", "hello"),
            ("Hello ", "  Hello")
        ]
        
        for string in strings {
            XCTAssertFalse(PermutationStrings.isPermutation(string.0, string.1), "'\(string.0)' '\(string.1)'")
        }
    }
}
