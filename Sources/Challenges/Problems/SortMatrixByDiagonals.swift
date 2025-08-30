enum SortMatrixByDiagonals {
  static func sortMatrix(_ grid: [[Int]]) -> [[Int]] {
    var _grid = grid
    let size = grid.count
    guard size > 1 else { return grid }
    
    for row in 0..<size {
      var diagonal: [Int] = []
      var r = row
      var c = 0
      var indices: [(Int, Int)] = []
      
      while r < size, c < size {
        indices.append((r, c))
        diagonal.append(grid[r][c])
        r += 1
        c += 1
      }
      
      diagonal = diagonal.sorted(by: >)
      
      for (i, index) in indices.enumerated() {
        _grid[index.0][index.1] = diagonal[i]
      }
    }
    
    for column in 1..<size {
      var diagonal: [Int] = []
      var r = 0
      var c = column
      var indices: [(Int, Int)] = []
      
      while r < size, c < size {
        indices.append((r, c))
        diagonal.append(grid[r][c])
        r += 1
        c += 1
      }
      
      diagonal = diagonal.sorted(by: <)
      for (i, index) in indices.enumerated() {
        _grid[index.0][index.1] = diagonal[i]
      }
    }
    return _grid
  }
}
