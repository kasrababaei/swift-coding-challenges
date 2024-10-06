/*
 Given the head of a linked list, return the node where the cycle begins. If there is no cycle,
 return null.

 There is a cycle in a linked list if there is some node in the list that can be reached again by
 continuously following the next pointer. Internally, pos is used to denote the index of the node
 that tail's next pointer is connected to (0-indexed). It is -1 if there is no cycle. Note that
 pos is not passed as a parameter.

 Do not modify the linked list.
 
 Examples:
 
 Input: head = [3,2,0,-4], pos = 1
 Output: tail connects to node index 1
 Explanation: There is a cycle in the linked list, where tail connects to the second node.
 
 Input: head = [1,2], pos = 0
 Output: tail connects to node index 0
 Explanation: There is a cycle in the linked list, where tail connects to the first node.
 
 Input: head = [1], pos = -1
 Output: no cycle
 Explanation: There is no cycle in the linked list.
 
 Constraints:

 The number of the nodes in the list is in the range [0, 104].
 -105 <= Node.val <= 105
 pos is -1 or a valid index in the linked-list.
 
 Follow up: Can you solve it using O(1) (i.e. constant) memory?
 */

enum DetectLinkedListCycle {
    static func detectCycle(_ head: ListNode?) -> ListNode? {
        var slow: ListNode? = head
        var fast: ListNode? = head
        
        while slow != nil, fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if slow === fast {
                // There's a cycle.
                // slow has travelled: a + b, where
                //     - a is the distance from head to the cycle entrance
                //     - b is the distance from the cycle entrance to the meeting position
                // fast has travelled: 2(a+b), twice the distance because it travels twice faster
                // it can also be written as k⨉c, where c is the length of the cycle.
                // so, a + b = k⨉c
                break
            }
        }
        
        if fast?.next == nil {
            return nil
        }
        
        // moving the fast moving node to the start
        fast = head
        
        // moving both forward at the same speed
        // they'll meet after k⨉(c-b) which is equal to a (distance from the start to the entrance)
        while fast !== slow {
            slow = slow?.next
            fast = fast?.next
        }
        
        return fast
    }
}
