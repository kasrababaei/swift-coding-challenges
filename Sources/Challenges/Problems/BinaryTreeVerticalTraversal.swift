enum BinaryTreeVerticalTraversal {
    static func verticalOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root else { return [] }
        
        var dict: [Int: [Int]] = [:]
        var queue: [(node: TreeNode, column: Int)] = [(root, 0)]
        
        while !queue.isEmpty {
            let (node, column) = queue.removeFirst()
            
            dict[column, default: []].append(node.val)
            
            if let left = node.left {
                queue.append((node: left, column: column - 1))
            }
            
            if let right = node.right {
                queue.append((node: right, column: column + 1))
            }
        }
        
        return dict.sorted(by: { $0.key < $1.key }).map(\.value)
    }
}

