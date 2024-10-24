import Testing
@testable import Challenges

struct FloodFillTests {
  @Test func caseOne() {
    #expect(FloodFill().floodFill([[1, 1, 1], [1, 1, 0], [1, 0, 1]], 1, 1, 2) == [[2, 2, 2], [2, 2, 0], [2, 0, 1]])
  }
  
  @Test func caseTwo() {
    #expect(FloodFill().floodFill([[0, 0, 0], [0, 0, 0]], 0, 0, 0) == [[0, 0, 0], [0, 0, 0]])
  }
}
