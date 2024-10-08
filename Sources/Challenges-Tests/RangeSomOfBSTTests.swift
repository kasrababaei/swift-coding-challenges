import XCTest
@testable import Challenges

final class RangeSomOfBSTTests: XCTestCase {
  func testOne() {
    let three = TreeNode(3)
    let seven = TreeNode(7)
    let eighteen = TreeNode(18)
    let five = TreeNode(5, three, seven)
    let fifteen = TreeNode(15, nil, eighteen)
        
    let root = TreeNode(10, five, fifteen)
        
    let result = RangeSomOfBST.rangeSumBST(root, 7, 15)
    XCTAssertEqual(result, 32)
  }
}
