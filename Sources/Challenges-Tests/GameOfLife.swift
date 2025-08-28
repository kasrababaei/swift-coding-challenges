import Testing
@testable import Challenges

struct GameOfLifeTests {
  @Test private func gameOfLife() {
    let inputs = [
      [[0, 1, 0], [0, 0, 1], [1, 1, 1], [0, 0, 0]],
      [[1, 1], [1, 0]]
    ]
    
    let outputs = [
      [[0, 0, 0], [1, 0, 1], [0, 1, 1], [0, 1, 0]],
      [[1, 1], [1, 1]]
    ]
    
    for (input, output) in zip(inputs, outputs) {
      var input = input
      GameOfLife.gameOfLife(&input)
      #expect(input == output)
    }
  }
}
