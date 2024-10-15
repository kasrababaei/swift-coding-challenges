import Testing
@testable import Challenges

struct ReverseLinkedListTests {
  @Test func caseOne() {
    #expect(ReverseLinkedList().reverseList(ListNode([1, 2, 3, 4, 5]))?.flatten() == [5, 4, 3, 2, 1])
    #expect(ReverseLinkedList().recursiveReverseList(ListNode([1, 2, 3, 4, 5]))?.flatten() == [5, 4, 3, 2, 1])
  }
  
  @Test func caseTwo() {
    #expect(ReverseLinkedList().reverseList(ListNode([1, 2]))?.flatten() == [2, 1])
    #expect(ReverseLinkedList().recursiveReverseList(ListNode([1, 2]))?.flatten() == [2, 1])
  }
}
