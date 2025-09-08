enum WidthOfBinaryTree {
  static func widthOfBinaryTree(_ root: TreeNode?) -> Int {
    guard let root else { return 0 }
    var queue: [(TreeNode, Int)] = [(root, 1)]
    var maxWidth = 0
    
    while !queue.isEmpty {
      let count = queue.count
      let left = queue.first!.1
      let right = queue.last!.1
      maxWidth = max(maxWidth, right &- left + 1)
      
      for _ in 0..<count {
        let (node, index) = queue.removeFirst()
        // Alternatively, could avoid using overflow operators by:
        // let index = index - left
        
        if let left = node.left {
          queue.append((left, index &* 2))
        }
        
        if let right = node.right {
          queue.append((right, index &* 2 + 1))
        }
      }
    }
    
    return maxWidth
  }
}
