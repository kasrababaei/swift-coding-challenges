import Testing
@testable import Challenges

struct Test {
  @Test func caseOne() {
    #expect(BinarySearch.search([-1, 0, 3, 5, 9, 12], 9) == 4)
  }
  
  @Test func caseTwo() {
    #expect(BinarySearch.search([-1, 0, 3, 5, 9, 12], 2) == -1)
  }
}
