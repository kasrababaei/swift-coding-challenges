import XCTest
@testable import Challenges

final class JumpGameTests: XCTestCase {
    var item: JumpGame { JumpGame() }
    
    func testOne() {
        XCTAssertTrue(item.canJump([2,3,1,1,4]))
    }
    
    func testTwo() {
        XCTAssertFalse(item.canJump([3,2,1,0,4]))
    }
}
