/*
 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 Every close bracket has a corresponding open bracket of the same type.

 Example 1:

 Input: s = "()"

 Output: true

 Example 2:

 Input: s = "()[]{}"

 Output: true

 Example 3:

 Input: s = "(]"

 Output: false

 Example 4:

 Input: s = "([])"

 Output: true


 Constraints:

 1 <= s.length <= 104
 s consists of parentheses only '()[]{}'.
 */
enum ValidParentheses {
  static func isValid(_ s: String) -> Bool {
    let opens: Set<Character> = ["(", "{", "["]
    let close: [Character: Character] = ["]": "[", ")": "(", "}": "{"]
    var stack: [Character] = []
        
    for char in s {
      if opens.contains(char) {
        stack.append(char)
      } else if stack.last == close[char] {
        stack.removeLast()
      } else {
        return false
      }
    }
        
    return stack.isEmpty
  }
}
