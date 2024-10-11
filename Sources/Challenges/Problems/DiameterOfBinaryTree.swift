/*
 Given the root of a binary tree, return the length of the diameter of the tree.

 The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.

 The length of a path between two nodes is represented by the number of edges between them.
 
 Example 1:
 Input: root = [1,2,3,4,5]
 Output: 3
 Explanation: 3 is the length of the path [4,2,1,3] or [5,2,1,3].
 Example 2:

 Input: root = [1,2]
 Output: 1
 
 Constraints:

 The number of nodes in the tree is in the range [1, 104].
 -100 <= Node.val <= 100
 */
class DiameterOfBinaryTree {
  func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
    var diameter = 0
    recursive(root, diameter: &diameter)
    return diameter
  }
  
  @discardableResult
  private func recursive(_ tree: TreeNode?, diameter: inout Int) -> Int {
    guard let tree else { return 0 }
    
    // the longest path in the tree would consist of a node, its longest left branch, and its
    // longest right branch
    let left = recursive(tree.left, diameter: &diameter)
    let right = recursive(tree.right, diameter: &diameter)
    
    diameter = max(diameter, left + right)
    
    return max(left, right) + 1
  }
}
