class ListNode {
    var val: Int
    var next: ListNode?
    init() {
        self.val = 0
        self.next = nil
    }
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
    
    init(_ array: [Int]) {
        var head: ListNode? = nil
        var tail: ListNode? = nil
        
        for value in array {
            let node = ListNode(value)
            
            if head == nil {
                head = node
                tail = node
            } else {
                tail?.next = node
                tail = node
            }
        }
        
        self.val = head!.val
        self.next = head!.next
    }
    
    func flatten() -> [Int] {
        var node: ListNode? = self
        var result: [Int] = []
        
        while node != nil {
            result.append(node!.val)
            node = node?.next
        }
        
        return result
    }
}
