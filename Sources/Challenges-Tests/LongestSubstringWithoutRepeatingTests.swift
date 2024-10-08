import XCTest
@testable import Challenges

final class LongestSubstringWithoutRepeatingTests: XCTestCase {
  func testOne() {
    XCTAssertEqual(LongestSubstringWithoutRepeating.lengthOfLongestSubstring("abba"), 2)
    XCTAssertEqual(LongestSubstringWithoutRepeating.lengthOfLongestSubstring("bbbbb"), 1)
    XCTAssertEqual(LongestSubstringWithoutRepeating.lengthOfLongestSubstring("pwwkew"), 3)
    XCTAssertEqual(LongestSubstringWithoutRepeating.lengthOfLongestSubstring(" "), 1)
    XCTAssertEqual(LongestSubstringWithoutRepeating.lengthOfLongestSubstring("au"), 2)
    XCTAssertEqual(LongestSubstringWithoutRepeating.lengthOfLongestSubstring("dvdf"), 3)
    XCTAssertEqual(LongestSubstringWithoutRepeating.lengthOfLongestSubstring("cdd"), 2)
  }
}
