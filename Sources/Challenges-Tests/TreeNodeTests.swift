import XCTest
@testable import Challenges

final class TreeNodeTests: XCTestCase {
  func testSearch() {
    let root = TreeNode(8, 3, 14, 1, 6, 13, nil, 4, 7)
        
    XCTAssertEqual(root.search(value: 3), TreeNode(3, 1, 6))
    XCTAssertEqual(root.search(value: 12), nil)
    XCTAssertEqual(root.search(value: 8), root)
    XCTAssertEqual(root.search(value: 6), 6)
    XCTAssertEqual(root.search(value: 14), TreeNode(14, 13, nil))
  }
    
  func testResultBuilder() {
    let node = TreeNode(3, 5, 1, 6, 2, 0, 8, nil, nil, 7, 4)
        
    XCTAssertEqual(node.bfs(node), [3, 5, 1, 6, 2, 0, 8, 7, 4])
  }
}
