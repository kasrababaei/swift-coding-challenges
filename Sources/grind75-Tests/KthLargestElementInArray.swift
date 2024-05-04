import XCTest
@testable import grind75

final class KthLargestElementInArrayTests: XCTestCase {
    func testOne() {
        let nums = [3,2,1,5,6,4]
        let k = 2
        let expectedResult = 5
        
        XCTAssertEqual(KthLargestElementInArray.findKthLargest(nums, k), expectedResult)
    }
    
    func testTwo() {
        let nums = [3,2,3,1,2,4,5,5,6]
        let k = 4
        let expectedResult = 4
        
        XCTAssertEqual(KthLargestElementInArray.findKthLargest(nums, k), expectedResult)
    }
    
    func testThree() {
        let nums = [2, 1]
        let k = 2
        let expectedResult = 1
        
        XCTAssertEqual(KthLargestElementInArray.findKthLargest(nums, k), expectedResult)
    }
}
