class ListNode {
    var val: Int?
    var next: ListNode?
    
    init() {
        self.val = nil
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
        
        self.val = head?.val
        self.next = head?.next
    }
    
    func flatten() -> [Int] {
        var node: ListNode? = self
        var result: [Int] = []
        
        while node != nil {
            guard let val = node?.val else { return result }
            result.append(val)
            node = node?.next
        }
        
        return result
    }
    
    func addAtHead(_ val: Int) {
        if let oldValue = self.val {
            let oldHead = ListNode(oldValue, next)
            self.next = oldHead
        }
        self.val = val
    }
    
    func addAtTail(_ val: Int) {
        var tail = self
        
        while tail.next != nil {
            tail = tail.next!
        }
        
        tail.next = ListNode(val)
    }
    
    func get(_ index: Int) -> Int {
        var current: ListNode? = self
        
        for _ in 0..<index {
            current = current?.next
        }
        
        return current?.val ?? -1
    }
    
    func addAtIndex(_ index: Int, _ val: Int) {
        var previous: ListNode? = self
        var current: ListNode? = self
        
        for _ in 0..<index {
            previous = current
            current = current?.next
            guard current != nil else {
                return
            }
        }
        
        previous?.next = ListNode(val, current)
    }
    
    func deleteAtIndex(_ index: Int) {
        var current: ListNode? = self
        var previous = current
        
        for _ in 0..<index {
            previous = current
            current = current?.next
        }
        
        previous?.next = current?.next
    }
}
