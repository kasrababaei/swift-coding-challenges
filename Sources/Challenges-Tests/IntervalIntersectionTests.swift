import XCTest
@testable import Challenges

final class IntervalIntersectionTest: XCTestCase {
    func testOne() {
        let a = [[0,2],[5,10],[13,23],[24,25]]
        let b = [[1,5],[8,12],[15,24],[25,26]]
        let expected = [[1,2],[5,5],[8,10],[15,23],[24,24],[25,25]]
        
        XCTAssertEqual(IntervalIntersection.intervalIntersection(a, b), expected)
    }
    
    func testTwo() {
        let a = [[1,3],[5,9]]
        let b: [[Int]] = []
        let expected: [[Int]] = []
        
        XCTAssertEqual(IntervalIntersection.intervalIntersection(a, b), expected)
    }
    
    func testThree() {
        let a = [[8,15]]
        let b = [[2,6],[8,10],[12,20]]
        let expected = [[8,10],[12,15]]
        
        XCTAssertEqual(IntervalIntersection.intervalIntersection(a, b), expected)
    }
    
    func testFour() {
        let a = [[3,5],[9,20]]
        let b = [[4,5],[7,10],[11,12],[14,15],[16,20]]
        let expected = [[4,5],[9,10],[11,12],[14,15],[16,20]]
        
        XCTAssertEqual(IntervalIntersection.intervalIntersection(a, b), expected)
    }
    
    func testFive() {
        let a = [[4,6],[7,8],[10,17]]
        let b = [[5,10]]
        let expected = [[5,6],[7,8],[10,10]]
        
        XCTAssertEqual(IntervalIntersection.intervalIntersection(a, b), expected)
    }
}
