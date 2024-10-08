import Testing
@testable import Challenges

struct DetectLinkedListCycleTests {
  @Test func one() {
    let list = ListNode([3, 2, 0, -4])
    let tail = list.node(at: 3)
    tail?.next = list.node(at: 1)
        
    #expect(DetectLinkedListCycle.detectCycle(list) === list.node(at: 1))
  }
    
  @Test func two() {
    let list = ListNode([1, 2])
    let tail = list.node(at: 1)
    tail?.next = list.node(at: 0)
        
    #expect(DetectLinkedListCycle.detectCycle(list) === list.node(at: 0))
  }
    
  @Test func three() {
    let list = ListNode([1])
        
    #expect(DetectLinkedListCycle.detectCycle(list) === nil)
  }
}
