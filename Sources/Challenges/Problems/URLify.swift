// Write a method to replace all spaces in a string with `%20`. You may assume that the string has
// sufficient space at the end to hold the additional characters, and that you are given the "true"
// length of the string. For example, "Mr John Smit    ", 13 -> "Mr%20John%20Smith"

enum URLify {
  static func urlify(_ string: String, _ length: Int) -> String {
    guard !string.isEmpty, length > 0 else {
      return ""
    }
        
    let replacement = "%20"
    var output: String = ""
    var spacesCount = 0
        
    for (index, char) in string.enumerated() {
      if char.isWhitespace {
        spacesCount += 1
                
        // Avoid adding back to back whitespaces
        guard spacesCount == 1 else { continue }
                
        // Ignore leading whitespaces
        guard !output.isEmpty else { continue }
                
        // Ignore trailing whitespaces
        guard index != string.count - 1 else { continue }
                
        output += replacement
      } else {
        spacesCount = 0
        output += String(char)
      }
    }
        
    return output
  }
}
