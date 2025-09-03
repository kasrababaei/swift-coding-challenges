import Testing
@testable import Challenges

struct KSmallestPairsTests {
  @Test func kSmallestPairs() async throws {
    #expect(KSmallestPairs.kSmallestPairs([1, 7, 11], [2, 4, 6], 3) == [[1, 2], [1, 4], [1, 6]])
    #expect(KSmallestPairs.kSmallestPairs([1, 1, 2], [1, 2, 3], 2) == [[1, 1], [1, 1]])
  }
}
