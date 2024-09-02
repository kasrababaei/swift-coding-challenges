import XCTest
@testable import Challenges

final class MergeSortedArrayTests: XCTestCase {
    func testOne() {
        var nums1 = [1,2,3,0,0,0]
        MergeSortedArray.merge(&nums1, 3, [2,5,6], 3)
        XCTAssertEqual(nums1, [1,2,2,3,5,6])
    }
    
    func testTwo() {
        var nums1 = [1]
        MergeSortedArray.merge(&nums1, 1, [], 0)
        XCTAssertEqual(nums1, [1])
    }
    
    func testThree() {
        var nums1 = [0]
        MergeSortedArray.merge(&nums1, 0, [1], 1)
        XCTAssertEqual(nums1, [1])
    }
}
