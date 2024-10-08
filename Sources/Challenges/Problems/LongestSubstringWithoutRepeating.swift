/*
 Given a string s, find the length of the longest
 substring
  without repeating characters.

 Example 1:

 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 Example 2:

 Input: s = "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 Example 3:

 Input: s = "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
 */

enum LongestSubstringWithoutRepeating {
  static func lengthOfLongestSubstring(_ s: String) -> Int {
    guard s.count > 1 else {
      return s.count
    }
        
    var dict: [Character: Int] = [:]
    var startIndex = 0
    var count = 0
        
    for (index, character) in s.enumerated() {
      if let duplicateCharacterIndex = dict[character] {
        startIndex = max(startIndex, duplicateCharacterIndex + 1)
      }
            
      count = max(count, index - startIndex + 1)
      dict[character] = index
    }
        
    return count
  }
}
