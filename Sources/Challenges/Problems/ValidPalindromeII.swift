/*
 Given a string s, return true if the s can be palindrome after deleting at most one character from it.

 Example 1:

 Input: s = "aba"
 Output: true
 Example 2:

 Input: s = "abca"
 Output: true
 Explanation: You could delete the character 'c'.
 Example 3:

 Input: s = "abc"
 Output: false
  

 Constraints:

 1 <= s.length <= 105
 s consists of lowercase English letters.
 */

enum ValidPalindromeII {
  static func validPalindrome(_ s: String) -> Bool {
    isPalindrome(s, true, s.startIndex, s.index(before: s.endIndex))
  }
    
  static func isPalindrome(_ s: String, _ allowDeletion: Bool, _ startIndex: String.Index, _ endIndex: String.Index) -> Bool {
    var head  = startIndex
    var tail = endIndex
        
    while head < tail {
      if s[head] != s[tail] {
        guard allowDeletion else {
          return false
        }
                
        return isPalindrome(s, false, head, s.index(before: tail))
          || isPalindrome(s, false, s.index(after: head), tail)
      }
            
      head = s.index(after: head)
      tail = s.index(before: tail)
    }
        
    return true
  }
    
  static func test() {
    [
      ("aba", true),
      ("abca", true),
      ("abc", false),
      ("bddb", true),
      ("deeee", true),
      ("eddze", true),
      ("aguokepatgbnvfqmgmlcupuufxoohdfpgjdmysgvhmvffcnqxjjxqncffvmhvgsymdjgpfdhooxfuupuculmgmqfvnbgtapekouga", true)
    ].forEach { string, expectation in
      if validPalindrome(string) == expectation {
        print(true)
      } else {
        print("Expected false, got \(expectation).")
      }
    }
  }
}
