import Testing
@testable import Challenges

struct WidthOfBinaryTreeTests {
  @Test func widthOfBinaryTree() async throws {
    let inputs: [(TreeNode, Int)] = [
      (TreeNode(1, 3, 2, 5, 3, nil, 9), 4),
      (TreeNode(1, 3, 2, 5, nil, nil, 9, 6, nil, 7), 7),
      (TreeNode(1, 3, 2, 5), 2),
      (
        TreeNode(
          0, 0, 0, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil, nil, 0, 0, nil
        ),
        2
      )
    ]
      
    for (tree, output) in inputs {
      #expect(WidthOfBinaryTree.widthOfBinaryTree(tree) == output)
    }
  }

}
