/*
 You are given an image represented by an m x n grid of integers image, where image[i][j] represents
 the pixel value of the image. You are also given three integers sr, sc, and color. Your task is to
 perform a flood fill on the image starting from the pixel image[sr][sc].
 
 To perform a flood fill:
 
 Begin with the starting pixel and change its color to color.
 Perform the same process for each pixel that is directly adjacent (pixels that share a side with
 the original pixel, either horizontally or vertically) and shares the same color as the starting
 pixel.
 
 Keep repeating this process by checking neighboring pixels of the updated pixels and modifying
 their color if it matches the original color of the starting pixel.
 
 The process stops when there are no more adjacent pixels of the original color to update.
 Return the modified image after performing the flood fill.
 
 Example 1:
 Input: image = [[1,1,1],[1,1,0],[1,0,1]], sr = 1, sc = 1, color = 2
 Output: [[2,2,2],[2,2,0],[2,0,1]]
 
 Example 2:
 Input: image = [[0,0,0],[0,0,0]], sr = 0, sc = 0, color = 0
 Output: [[0,0,0],[0,0,0]]
 
 Constraints:
 
 m == image.length
 n == image[i].length
 1 <= m, n <= 50
 0 <= image[i][j], color < 216
 0 <= sr < m
 0 <= sc < n
 */

class FloodFill {
  struct Index: Hashable {
    let row: Int
    let column: Int
    
    init(_ row: Int, _ column: Int) {
      self.row = row
      self.column = column
    }
  }
  
  var originalColor = 0
  var visited: Set<Index> = []
  var queue: Set<Index> = []
  
  func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
    var result = image
    
    originalColor = image[sr][sc]
    queue.insert(Index(sr, sc))
    
    while !queue.isEmpty {
      let index = queue.first!
      fill(&result, index.row, index.column, color)
    }
    
    return result
  }
  
  func fill(_ image: inout [[Int]], _ sr: Int, _ sc: Int, _ color: Int) {
    image[sr][sc] = color
    queue.remove(Index(sr, sc))
    visited.insert(Index(sr, sc))
    
    let left = Index(sr, max(0, sc - 1))
    let right = Index(sr, min(image[0].count - 1, sc + 1))
    let top = Index(max(0, sr - 1), sc)
    let bottom = Index(min(image.count - 1, sr + 1), sc)
    
    for index in [left, right, top, bottom] where !visited.contains(index) {
      if image[index.row][index.column] == originalColor {
        image[index.row][index.column] = color
        queue.insert(index)
      }
    }
  }
}
