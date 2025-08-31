import Testing
@testable import Challenges

struct CanFinishTests {
  @Test func canFinish() async throws {
    let inputs = [
      (2, [[1, 0]], true),
      (2, [[1, 0], [0, 1]], false)
    ]
      
    for input in inputs {
      #expect(CanFinish.canFinish(input.0, input.1) == input.2)
    }
  }
}
