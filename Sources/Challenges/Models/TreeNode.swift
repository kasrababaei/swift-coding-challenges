class TreeNode: ExpressibleByIntegerLiteral {
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
    
    required convenience init(integerLiteral value: IntegerLiteralType) {
        self.init(value)
    }
    
    init(_ values: Int?...) {
        guard !values.isEmpty else { fatalError() }
        
        var queue = [TreeNode]()
        
        guard let rootValue = values.first, let rootInt = rootValue else {
            fatalError()
        }
        
        let rootNode = TreeNode(rootInt, nil, nil)
        queue.append(rootNode)
        
        var index = 1
        while !queue.isEmpty, index < values.count {
            let parentNode = queue.removeFirst()
            
            if let leftValue = values[index] {
                let leftNode = TreeNode(leftValue, nil, nil)
                parentNode.left = leftNode
                queue.append(leftNode)
            }
            
            index += 1
            
            if index < values.count, let rightValue = values[index] {
                let rightNode = TreeNode(rightValue, nil, nil)
                parentNode.right = rightNode
                queue.append(rightNode)
            }
            
            index += 1
        }
        
        self.val = rootNode.val
        self.left = rootNode.left
        self.right = rootNode.right
    }
    
    static var foo: TreeNode {
        let fifteen = TreeNode(15, nil, nil)
        let seven = TreeNode(7, nil, nil)
        let twenty = TreeNode(20, fifteen, seven)
        let nine = TreeNode(9, nil, nil)
        let three = TreeNode(3, nine, twenty)
        
        return three
    }
    
    func search(value: Int) -> TreeNode? {
        var node: TreeNode? = self
        
        while node != nil, node?.val != value {
            if value > node!.val {
                node = node?.right
            } else {
                node = node?.left
            }
        }
        
        return node
    }
    
    func bfs(_ node: TreeNode) -> [Int] {
        var values: [Int] = []
        var queue = [node]
        
        while !queue.isEmpty {
            let node = queue.first!
            
            if let left = node.left {
                queue.append(left)
            }
            
            if let right = node.right {
                queue.append(right)
            }
            
            values.append(node.val)
            queue.removeFirst()
        }
        
        return values
    }
    
    func dfs(_ node: TreeNode) -> [Int] {
        var result: [Int] = []
        recursive(node, result: &result)
        return result
    }
    
    private func recursive(_ node: TreeNode, result: inout [Int]) {
        result.append(node.val)
        
        if let left = node.left {
            recursive(left, result: &result)
        }
        
        if let right = node.right {
            recursive(right, result: &result)
        }
    }
}

extension TreeNode: Equatable {
    static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        guard lhs.val == rhs.val else {
            return false
        }
        
        if let lhsLeft = lhs.left {
            guard let rhsLeft = rhs.left, lhsLeft.val == rhsLeft.val else {
                return false
            }
        }
        
        if let lhsRight = lhs.right {
            guard let rhsRight = rhs.right, lhsRight.val == rhsRight.val else {
                return false
            }
        }
        
        return true
    }
}

extension TreeNode: CustomDebugStringConvertible {
    var debugDescription: String {
        let left = if let left {
            "\(left.val)"
        } else {
            "None"
        }
        
        let right = if let right {
            "\(right.val)"
        } else {
            "None"
        }
        
        return "val: \(val) - left: \(left) - right: \(right)"
    }
}
