enum DFS {
    static func dfs(_ node: TreeNode) -> [Int] {
        var result: [Int] = []
        recursive(node, result: &result)
        return result
    }
    
    private static func recursive(_ node: TreeNode, result: inout [Int]) {
        result.append(node.val)
        
        if let left = node.left {
            recursive(left, result: &result)
        }
        
        if let right = node.right {
            recursive(right, result: &result)
        }
    }
}
