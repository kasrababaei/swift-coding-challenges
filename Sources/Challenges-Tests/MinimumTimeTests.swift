import Testing
@testable import Challenges

struct MinimumTimeTests {
    @Test func minimumTime() async throws {
      #expect(MinimumTime.minimumTime([1, 2, 3], 5) == 3)
      #expect(MinimumTime.minimumTime([2], 1) == 2)
      #expect(MinimumTime.minimumTime([2], 2) == 4)
    }
}
