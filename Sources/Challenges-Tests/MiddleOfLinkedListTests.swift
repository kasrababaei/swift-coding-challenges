import Testing
@testable import Challenges

struct MiddleOfLinkedListTests {
  @Test func odd() async throws {
    let five = ListNode(5)
    let four = ListNode(4, five)
    let three = ListNode(3, four)
    let two = ListNode(2, three)
    let one = ListNode(1, two)
        
    #expect(MiddleOfLinkedList.middleNode(one) === three)
  }
    
  @Test func even() async throws {
    let six = ListNode(6)
    let five = ListNode(5, six)
    let four = ListNode(4, five)
    let three = ListNode(3, four)
    let two = ListNode(2, three)
    let one = ListNode(1, two)
        
    #expect(MiddleOfLinkedList.middleNode(one) === four)
  }
}
