import Testing
@testable import Challenges

struct MinimumCostWalkWeightedGraphTests {
  @Test func minimumCost() {
    let result = MinimumCostWalkWeightedGraph.minimumCost(5, [[0, 1, 7], [1, 3, 7], [1, 2, 1]], [[0, 3], [3, 4]])
    #expect(result == [1, -1])
  }
}
