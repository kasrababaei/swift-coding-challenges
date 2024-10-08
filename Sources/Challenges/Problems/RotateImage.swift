/*
 You are given an n x n 2D matrix representing an image, rotate the image by 90 degrees (clockwise).
 You have to rotate the image in-place, which means you have to modify the input 2D matrix directly.
 DO NOT allocate another 2D matrix and do the rotation.
 */

enum RotateImage {
  static func rotate(_ matrix: inout [[Int]]) {
    let rowsCount = matrix.count
        
    // Transpose
    for r in 0..<rowsCount {
      for c in 0...r {
        let temp = matrix[r][c]
        matrix[r][c] = matrix[c][r]
        matrix[c][r] = temp
      }
    }
        
    // Reflection
    for r in 0..<rowsCount {
      for c in 0..<(rowsCount / 2) {
        let temp = matrix[r][c]
        matrix[r][c] = matrix[r][rowsCount - 1 - c]
        matrix[r][rowsCount - 1 - c] = temp
      }
    }
  }
    
  static func _rotate(_ matrix: inout [[Int]]) {
    var left = 0
    var right = matrix.count - 1
        
    while left < right {
      for offset in 0..<(right - left) {
        let top = left
        let bottom = right
                
        let element = matrix[top][left + offset]
        matrix[top][left + offset] = matrix[bottom - offset][left]
        matrix[bottom - offset][left] = matrix[bottom][right - offset]
        matrix[bottom][right - offset] = matrix[top + offset][right]
        matrix[top + offset][right] = element
      }
            
      left += 1
      right -= 1
    }
  }
}
