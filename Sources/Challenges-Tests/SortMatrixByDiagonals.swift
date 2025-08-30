import Testing
@testable import Challenges

struct SortMatrixByDiagonalsTests {
  @Test func sortMatrix() async throws {
    let inputs = [
      [[1, 7, 3], [9, 8, 2], [4, 5, 6]],
      [[0, 1], [1, 2]],
      [[1]]
    ]
      
    let outputs = [
      [[8, 2, 3], [9, 6, 7], [4, 5, 1]],
      [[2, 1], [1, 0]],
      [[1]]
    ]
      
    for (input, output) in zip(inputs, outputs) {
      #expect(SortMatrixByDiagonals.sortMatrix(input) == output)
    }
  }
}
