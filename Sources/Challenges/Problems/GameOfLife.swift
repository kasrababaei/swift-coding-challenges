enum GameOfLife {
  static func gameOfLife(_ board: inout [[Int]]) {
    for i in 0..<board.row {
      for j in 0..<board.column {
        let isAlive = board[i][j] == 1
        let aliveNeighborsCount = board.aliveNeighborsCount(i, j)
        
        if isAlive {
          if !(2...3 ~= aliveNeighborsCount) {
            board[i][j]  = 2
          }
        } else {
          if aliveNeighborsCount == 3 {
            board[i][j] = 3
          }
        }
      }
    }
    
    for i in 0..<board.row {
      for j in 0..<board.column {
        if board[i][j] == 2 {
          board[i][j] = 0
        } else if board[i][j] == 3 {
          board[i][j] = 1
        }
      }
    }
  }
}

private extension Array where Element == [Int] {
  var row: Int { count }
  var column: Int { self[0].count }
  
  func aliveNeighborsCount(_ row: Int, _ column: Int) -> Int {
    neighbours(row, column)
      .map {  $0 == 0 || $0 == 3 ? 0 : 1 }
      .reduce(0, +)
  }
  
  /// Returns [Moore neighbourhood](https://en.wikipedia.org/wiki/Moore_neighborhood).
  func neighbours(_ row: Int, _ column: Int) -> [Int] {
    [
      cell(row - 1, column - 1),
      cell(row - 1, column),
      cell(row - 1, column + 1),
      cell(row, column + 1),
      cell(row + 1, column + 1),
      cell(row + 1, column),
      cell(row + 1, column - 1),
      cell(row, column - 1)
    ]
  }
  
  func cell( _ row: Int, _ column: Int) -> Int {
    isInbound(row, column) ? self[row][column] : 0
  }
  
  func isInbound(_ i: Int, _ j: Int) -> Bool {
    indices.contains(i)
      && self[i].indices.contains(j)
  }
}
