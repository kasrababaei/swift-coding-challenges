/*
 Given a string s, return the longest palindromic
 
 substring
 in s.
 
 Example 1:
 
 Input: s = "babad"
 Output: "bab"
 Explanation: "aba" is also a valid answer.
 Example 2:
 
 Input: s = "cbbd"
 Output: "bb"
 
 
 Constraints:
 
 1 <= s.length <= 1000
 s consist of only digits and English letters.
 
 */
final class LongestPalindrome {
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 else { return s }
        
        let characters = Array(s)
        var start = 0
        var maxLength = 1
        
        func expandAroundCenter(left: Int, right: Int) {
            var l = left
            var r = right
            while l >= 0 && r < characters.count && characters[l] == characters[r] {
                if r - l + 1 > maxLength {
                    start = l
                    maxLength = r - l + 1
                }
                l -= 1
                r += 1
            }
        }
        
        for i in 0..<characters.count {
            // Odd-length palindromes (single character center)
            expandAroundCenter(left: i, right: i)
            // Even-length palindromes (consecutive characters center)
            expandAroundCenter(left: i, right: i + 1)
        }
        
        let startIndex = s.index(s.startIndex, offsetBy: start)
        let endIndex = s.index(startIndex, offsetBy: maxLength)
        return String(s[startIndex..<endIndex])
    }
    
    func _longestPalindrome(_ s: String) -> String {
        let length = s.count
        let characters = Array(s)
        
        guard length > 1 else {
            return s
        }
        
        var lhs = 0
        var rhs = 0
        var dp = Array(repeating: Array(repeating: false, count: length), count: length)
        
        for i in 1..<length {
            for j in 0..<i where characters[j] == characters[i] && (dp[j+1][i-1] || i - j <= 2) {
                dp[j][i] = true
                if i - j > rhs - lhs {
                    lhs = j
                    rhs = i
                }
            }
        }
        
        return String(characters[lhs...rhs])
    }
}
