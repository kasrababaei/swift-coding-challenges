class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init() { self.val = 0; self.left = nil; self.right = nil; }
    init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
    
    static var foo: TreeNode {
        let fifteen = TreeNode(15, nil, nil)
        let seven = TreeNode(7, nil, nil)
        let twenty = TreeNode(20, fifteen, seven)
        let nine = TreeNode(9, nil, nil)
        let three = TreeNode(3, nine, twenty)
        
        return three
    }
}

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

