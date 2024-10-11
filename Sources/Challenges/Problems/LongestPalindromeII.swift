enum LongestPalindromeII {
  static func longestPalindrome(_ s: String) -> Int {
    let dict = s.reduce(into: [UInt8: Int]()) { res, char in
      res[char.asciiValue!, default: 0] += 1
    }
    
    var length = 0
    var hasOdds = false
    
    for (_, count) in dict {
      if count % 2 == 0 {
        length += count
      } else {
        length += count - 1
        hasOdds = true
      }
    }
    
    return hasOdds ? length + 1 : length
  }
}
