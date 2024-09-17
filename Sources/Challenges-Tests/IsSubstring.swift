import XCTest
@testable import Challenges

final class StringRotationTests: XCTestCase {
    func testOne() {
        let s1 = "waterbottle"
        let s2 = "erbottlewat"
        XCTAssertTrue(IsSubstring.isSubstring(s1, s2))
    }
    
    func testGinger() {
        let s1 = "apple"
        let s2 = "elppa"
        XCTAssertTrue(IsSubstring.isSubstring(s1, s2))
    }
}
