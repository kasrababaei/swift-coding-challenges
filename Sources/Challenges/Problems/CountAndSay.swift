// The count-and-say sequence is a sequence of digit strings defined by the recursive formula:
// countAndSay(1) = "1"
// countAndSay(n) is the run-length encoding of countAndSay(n - 1).
// Run-length encoding (RLE) is a string compression method that works by replacing consecutive
// identical characters (repeated 2 or more times) with the concatenation of the character and the
// number marking the count of the characters (length of the run). For example, to compress the
// string "3322251" we replace "33" with "23", replace "222" with "32", replace "5" with "15" and
// replace "1" with "11". Thus the compressed string becomes "23321511".
// Given a positive integer n, return the nth element of the count-and-say sequence.
//
// Example 1:
// Input: n = 4
// Output: "1211"
// Explanation:
// countAndSay(1) = "1"
// countAndSay(2) = RLE of "1" = "11"
// countAndSay(3) = RLE of "11" = "21"
// countAndSay(4) = RLE of "21" = "1211"
// Example 2:
// Input: n = 1
// Output: "1"
// Explanation:
// This is the base case.
//
// Constraints:
// 1 <= n <= 30

enum CountAndSay {
  // Complexity: O(N + M)
  static func countAndSay(_ n: Int) -> String {
    guard n != 1 else { return "1" }
    var result = [1, 1]
    
    for _ in 2..<n {
      var count = 0
      var index = 0
      var value = result[index]
      var temp: [Int] = []
      
      while index < result.count {
        if value == result[index] {
          count += 1
        } else {
          temp.append(contentsOf: [count, value])
          count = 1
          value = result[index]
        }
        
        index += 1
      }
      
      if count > 0 { temp.append(contentsOf: [count, value]) }
      result = temp
    }
    
    return result.reduce(into: "") { $0 += "\($1)" }
  }
  
  // Complexity: O(N!)
  static func _countAndSay(_ n: Int) -> String {
    func rle(_ n: Int, _ current: String) -> String {
      if n == 1 { return  "1" }
      
      let res = current + rle(n - 1, current)
      guard var char = res.first else { return res }
      var count = 0
      var temp = ""
      
      for c in res {
        if c == char {
          count += 1
        } else {
          temp += "\(count)\(char)"
          count = 1
          char = c
        }
      }
      
      if count > 0 {
        temp += "\(count)\(char)"
      }
      return temp
    }
    
    return rle(n, "")
  }
}
