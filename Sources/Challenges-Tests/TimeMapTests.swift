import XCTest
@testable import Challenges

final class TimeMapTests: XCTestCase {
    func testOne() {
        let timeMap = TimeMap()
        timeMap.set("foo", "bar", 1)
        XCTAssertEqual(timeMap.get("foo", 1), "bar")
        XCTAssertEqual(timeMap.get("foo", 3), "bar")
        
        timeMap.set("foo", "bar2", 4)
        XCTAssertEqual(timeMap.get("foo", 4), "bar2")
        XCTAssertEqual(timeMap.get("foo", 5), "bar2")
    }
    
    func testTwo() {
        let timeMap = TimeMap()
        timeMap.set("assem","fat",20)
        timeMap.set("assem","thin",40)
        timeMap.set("hamza","thin",41)
        XCTAssertEqual(timeMap.get("hamza", 20), "")
    }
}
