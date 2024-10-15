/*
 Given the head of a singly linked list, reverse the list, and return the reversed list.
 
 Example 1:
 Input: head = [1,2,3,4,5]
 Output: [5,4,3,2,1]
 
 Example 2:
 Input: head = [1,2]
 Output: [2,1]
 
 Example 3:
 Input: head = []
 Output: []
 
 Constraints:
 The number of nodes in the list is the range [0, 5000].
 -5000 <= Node.val <= 5000
 
 Follow up: A linked list can be reversed either iteratively or recursively. Could you implement both?
 */

struct ReverseLinkedList {
  func reverseList(_ head: ListNode?) -> ListNode? {
    guard head?.val != nil else { return nil }
    
    var previous: ListNode? = nil
    var current = head
    
    while current != nil {
      let next = current?.next
      current?.next = previous
      previous = current
      current = next
    }
    
    return previous
  }
  
  func recursiveReverseList(_ head: ListNode?) -> ListNode? {
    // Good to watch: https://www.youtube.com/watch?v=S92RuTtt9EE
    // Check head == nil for case where a nil is passed.
    if head == nil || head?.next == nil {
      return head
    }
    
    let new = recursiveReverseList(head?.next)
    head?.next?.next = head
    head?.next = nil
    return new
  }
}
