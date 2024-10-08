import XCTest
@testable import Challenges

final class BuildingWithOceanViewTests: XCTestCase {
  func testOne() {
    let result = BuildingWithOceanView.findBuildings([4, 2, 3, 1])
    XCTAssertEqual(result, [0, 2, 3])
  }
    
  func testTwo() {
    let result = BuildingWithOceanView.findBuildings([4, 3, 2, 1])
    XCTAssertEqual(result, [0, 1, 2, 3])
  }
    
  func testThree() {
    let result = BuildingWithOceanView.findBuildings([1, 3, 2, 4])
    XCTAssertEqual(result, [3])
  }
    
  func testFour() {
    let result = BuildingWithOceanView.findBuildings([2, 2, 2, 2])
    XCTAssertEqual(result, [3])
  }
}
