import Testing
@testable import Challenges

struct DeleteDuplicatesUnsortedTests {
  @Test func testOne() async throws {
    let tail = ListNode(2)
    let three = ListNode(3, tail)
    let two = ListNode(2, three)
    let head = ListNode(1, two)
        
    let result = ListNode(1, ListNode(3))
    #expect(DeleteDuplicatesUnsorted.deleteDuplicatesUnsorted(head)?.flatten() == result.flatten())
    #expect(DeleteDuplicatesUnsorted.WithDummyNode.deleteDuplicatesUnsorted(head)?.flatten() == result.flatten())
  }
    
  @Test func testTwo() async throws {
    let tail = ListNode(2)
    let one = ListNode(1, tail)
    let onePrime = ListNode(1, one)
    let head = ListNode(2, onePrime)
        
    #expect(DeleteDuplicatesUnsorted.deleteDuplicatesUnsorted(head) == nil)
    #expect(DeleteDuplicatesUnsorted.WithDummyNode.deleteDuplicatesUnsorted(head)?.flatten() == nil)
  }
    
  @Test func testThree() async throws {
    // [3,2,2,1,3,2,4]
    let tail = ListNode(4)
    let thirdTwo = ListNode(2, tail)
    let three = ListNode(3, thirdTwo)
    let one = ListNode(1, three)
    let secondTwo = ListNode(2, one)
    let firstTwo = ListNode(2, secondTwo)
    let head = ListNode(3, firstTwo)
        
    let result = ListNode(1, tail)
    #expect(DeleteDuplicatesUnsorted.deleteDuplicatesUnsorted(head)?.flatten() == result.flatten())
    #expect(DeleteDuplicatesUnsorted.WithDummyNode.deleteDuplicatesUnsorted(head)?.flatten() == result.flatten())
  }
}
