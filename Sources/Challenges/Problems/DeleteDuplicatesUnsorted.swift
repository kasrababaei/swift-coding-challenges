/*
 Given the head of a linked list, find all the values that appear more than once in the list and
 delete the nodes that have any of those values.

 Return the linked list after the deletions.
 
 Input: head = [1,2,3,2]
 Output: [1,3]
 Explanation: 2 appears twice in the linked list, so all 2's should be deleted. After deleting all
 2's, we are left with [1,3].
 
 Input: head = [2,1,1,2]
 Output: []
 Explanation: 2 and 1 both appear twice. All the elements should be deleted.
 
 Input: head = [3,2,2,1,3,2,4]
 Output: [1,4]
 Explanation: 3 appears twice and 2 appears three times. After deleting all 3's and 2's, we are
 left with [1,4].
 */
import Foundation

enum DeleteDuplicatesUnsorted {
    static func deleteDuplicatesUnsorted(_ head: ListNode?) -> ListNode? {
        var values: [Int] = []
        let set = NSCountedSet()
        var next = head
        
        while next != nil {
            values.append(next!.val!)
            set.add(next!.val!)
            next = next?.next
        }
        
        let head: ListNode? = ListNode(0)
        var tail = head
        
        for value in values where set.count(for: value) == 1 {
            let new = ListNode(value)
            tail?.next = new
            tail = new
        }
        
        return head?.next
    }
    
    enum WithDummyNode {
        static func deleteDuplicatesUnsorted(_ head: ListNode?) -> ListNode? {
            let set = NSCountedSet()
            let dummy = ListNode(-1, head)
            var current = dummy.next
            var previous: ListNode? = dummy
            
            var temp = head
            while temp != nil {
                set.add(temp!.val!)
                temp = temp?.next
            }
            
            while current != nil {
                if set.count(for: current!.val!) > 1 {
                    previous?.next = current?.next
                } else {
                    previous = current
                }
                
                current = current?.next
            }
            
            return dummy.next
        }
    }
}
