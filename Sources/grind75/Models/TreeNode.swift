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
