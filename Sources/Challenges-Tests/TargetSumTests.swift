import Testing
@testable import Challenges

struct TargetSumTests {
  @Test func findTargetSumWays() async throws {
    #expect(TargetSum.findTargetSumWays([1, 1, 1], 3) == 1)
    #expect(TargetSum.findTargetSumWays([1, 1, 1, 1, 1], 3) == 5)
    #expect(TargetSum.findTargetSumWays([1], 1) == 1)
    #expect(TargetSum.findTargetSumWays([1, 2, 3], 4) == 1)
  }
}
