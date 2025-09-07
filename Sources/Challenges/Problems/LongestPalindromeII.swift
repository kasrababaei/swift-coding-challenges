//  Given a string s which consists of lowercase or uppercase letters, return the length of the
// longest palindrome that can be built with those letters.
//
//  Letters are case sensitive, for example, "Aa" is not considered a palindrome.
//
//  Example 1:
//
//  Input: s = "abccccdd"
//  Output: 7
//  Explanation: One longest palindrome that can be built is "dccaccd", whose length is 7.
//  Example 2:
//
//  Input: s = "a"
//  Output: 1
//  Explanation: The longest palindrome that can be built is "a", whose length is 1.
//
//  Constraints:
//
//  1 <= s.length <= 2000
// s consists of lowercase and/or uppercase English letters only.

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
  
  func _longestPalindrome(_ s: String) -> Int {
    if s.count == 1 { return 1 }
    var dict: [UInt8: Int] = [:]
    var index = s.startIndex
    var count = 0
    
    while index < s.endIndex {
      let key = s[index].asciiValue!
      dict[key, default: 0] += 1
      if dict[key]! == 2 {
        count += 2
        dict.removeValue(forKey: key)
      }
      index = s.index(after: index)
    }
    
    return dict.isEmpty ? count : count + 1
  }
}
