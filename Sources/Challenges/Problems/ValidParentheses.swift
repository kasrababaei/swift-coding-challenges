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
