import Testing
@testable import Challenges

struct LinkedListCycleTests {
  @Test func hasCycleOne() async throws {
    // head = [3, 2, 0, -4], pos = 1
    let four = ListNode(-4)
    let zero = ListNode(0, four)
    let two = ListNode(2, zero)
    four.next = two
    let one = ListNode(3, two)
    #expect(LinkedListCycle.hasCycle(one))
  }
    
  @Test func hasCycleTwo() async throws {
    // head = [1, 2], pos = 0
    let two = ListNode(2)
    let one = ListNode(1, two)
    two.next = one
    #expect(LinkedListCycle.hasCycle(one))
  }
    
  @Test func hasCycleThree() async throws {
    // head = [1], pos = -1
    let one = ListNode(1)
    #expect(LinkedListCycle.hasCycle(one) == false)
  }
}
