import Testing
@testable import Challenges

struct BinarySearchTest {
  @Test func search() {
    #expect(BinarySearch.search([-1, 0, 3, 5, 9, 12], 9) == 4)
    #expect(BinarySearch.search([-1, 0, 3, 5, 9, 12], 2) == -1)
    #expect(BinarySearch.search([-1, 0, 3, 5, 9, 12, 18, 20, 26, 30, 48, 50, 51, 53], 12) == 5)
  }
}
