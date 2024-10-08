/*
 You are given the heads of two sorted linked lists list1 and list2.

 Merge the two lists into one sorted list. The list should be made by splicing together the nodes
 of the first two lists.

 Return the head of the merged linked list.
 
 Example 1:
 
 Input: list1 = [1,2,4], list2 = [1,3,4]
 Output: [1,1,2,3,4,4]
 Example 2:

 Input: list1 = [], list2 = []
 Output: []
 Example 3:

 Input: list1 = [], list2 = [0]
 Output: [0]

 Constraints:

 The number of nodes in both lists is in the range [0, 50].
 -100 <= Node.val <= 100
 Both list1 and list2 are sorted in non-decreasing order.
 */
enum MergeTwoLists {
  // Space complexity is O(1) since it only needs to keep the head and tail in the stack.
  static func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    if list1 == nil {
      return list2
    }
    if list2 == nil {
      return list1
    }
        
    let head = ListNode()
    var tail = head
        
    var list1 = list1
    var list2 = list2
        
    while(list1 != nil && list2 != nil) {
      if list1!.val! < list2!.val! {
        tail.next = list1!
        list1 = list1!.next
      } else {
        tail.next = list2!
        list2 = list2!.next
      }
            
      tail = tail.next!
    }
        
    tail.next = list1 == nil ? list2 : list1
        
    return head.next
  }
    
  static func test() {
    // for (list1, list2, output) in [sample1] {
    for (list1, list2, output) in [sample1, sample2] {
      let flatNodes = flatten(node: mergeTwoLists(list1, list2))
            
      if flatNodes == output {
        print("true")
      } else {
        print("false, expected \(output) but got:", flatNodes)
      }
    }
  }
    
  static func flatten(node: ListNode?) -> [Int] {
    guard let node else {
      return []
    }
        
    return [node.val!] + flatten(node: node.next)
  }
    
  static var sample1: (ListNode, ListNode, [Int]) {
    let list1 = ListNode(1, ListNode(2, ListNode(4, nil)))
    let list2 = ListNode(1, ListNode(3, ListNode(4, nil)))
    let expect = [1, 1, 2, 3, 4, 4]
    return (list1, list2, expect)
  }
    
  static var sample2: (ListNode, ListNode, [Int]) {
    let list1 = ListNode(0, nil)
    let list2 = ListNode(0, nil)
    let expect: [Int] = []
    return (list1, list2, expect)
  }
    
  /*
   // Recursive solution:
   // Space complexity is O(m + n) where m is the length of first list and n is the length of the second list
   // This is because the stack needs to hold each iteration in memory
   static func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
       guard let list1 else { return list2 }
       guard let list2 else { return list1 }
        
       if list1.val < list2.val {
           return ListNode(list1.val, ListNode(list2.val, mergeTwoLists(list1.next, list2.next)))
       } else {
           return ListNode(list2.val, ListNode(list1.val, mergeTwoLists(list1.next, list2.next)))
       }
   }
   */
    
}
