import Testing
@testable import Challenges

struct DiameterOfBinaryTreeTests {
  @Test func caseOne() async throws {
    let node = TreeNode(1, 2, 3, 4, 5)
      
    let diameter = DiameterOfBinaryTree()
    #expect(diameter.diameterOfBinaryTree(node) == 3)
  }
  
  @Test func caseTwo() async throws {
    let node = TreeNode(1, 2)
      
    let diameter = DiameterOfBinaryTree()
    #expect(diameter.diameterOfBinaryTree(node) == 1)
  }
}
