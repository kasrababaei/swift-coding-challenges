import XCTest
@testable import Challenges

final class RotateImageTests: XCTestCase {
  func testOne() {
    var input = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    let output = [[7, 4, 1], [8, 5, 2], [9, 6, 3]]
    RotateImage.rotate(&input)
        
    XCTAssertEqual(input, output)
  }
    
  func testTwo() {
    var input = [[5, 1, 9, 11], [2, 4, 8, 10], [13, 3, 6, 7], [15, 14, 12, 16]]
    let output = [[15, 13, 2, 5], [14, 3, 4, 1], [12, 6, 8, 9], [16, 7, 10, 11]]
    RotateImage.rotate(&input)
        
    XCTAssertEqual(input, output)
  }
    
  func testOnePrime() {
    var input = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    let output = [[7, 4, 1], [8, 5, 2], [9, 6, 3]]
    RotateImage._rotate(&input)
        
    XCTAssertEqual(input, output)
  }
    
  func testTwoPrime() {
    var input = [[5, 1, 9, 11], [2, 4, 8, 10], [13, 3, 6, 7], [15, 14, 12, 16]]
    let output = [[15, 13, 2, 5], [14, 3, 4, 1], [12, 6, 8, 9], [16, 7, 10, 11]]
    RotateImage._rotate(&input)
        
    XCTAssertEqual(input, output)
  }
}
