/*
 An n x n matrix is valid if every row and every column contains all the integers from 1 to n
 (inclusive).

 Given an n x n integer matrix matrix, return true if the matrix is valid. Otherwise, return false.
 
 Examples:
 Input: matrix = [[1,2,3],[3,1,2],[2,3,1]]
 Output: true
 Explanation: In this case, n = 3, and every row and column contains the numbers 1, 2, and 3.
 Hence, we return true.
 
 Input: matrix = [[1,1,1],[1,2,3],[1,2,3]]
 Output: false
 Explanation: In this case, n = 3, but the first row and the first column do not contain the numbers
 2 or 3.
 Hence, we return false.
 
 Constraints:

 n == matrix.length == matrix[i].length
 1 <= n <= 100
 1 <= matrix[i][j] <= n
 */

enum CheckValid {
    static func checkValid(_ matrix: [[Int]]) -> Bool {
        let length = matrix.count
        
        guard !matrix.isEmpty, matrix[0].count == length else { return false }
        guard length > 1 else { return matrix[0][0] == 1 }
        
        let reference = Set((1...length).map { $0 })
        
        for i in 0..<length {
            let row = Set(matrix[i])
            guard row.count == length else { return false }
            guard reference.subtracting(row).isEmpty else { return false }
        }
        
        for i in 0..<length {
            var column: Set<Int> = []
            
            for j in 0..<length {
                guard column.insert(matrix[j][i]).inserted else { return false }
            }
            
            guard column.count == length else { return false }
            guard reference.subtracting(column).isEmpty else { return false }
        }
        
        return true
    }
}
