import XCTest
@testable import grind75

final class ListNodeTests: XCTestCase {
    func testFlatten() {
        let array = [1, 9, 4, 6, 2, 7, 5]
        let list = ListNode(array)
        
        XCTAssertEqual(list.flatten(), array)
    }
}
