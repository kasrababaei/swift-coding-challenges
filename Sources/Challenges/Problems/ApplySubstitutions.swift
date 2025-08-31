//  You are given a replacements mapping and a text string that may contain placeholders
//  formatted as %var%, where each var corresponds to a key in the replacements mapping.
//  Each replacement value may itself contain one or more such placeholders. Each placeholder
// is replaced by the value associated with its corresponding replacement key.
//
//  Return the fully substituted text string which does not contain any placeholders.

import Foundation

enum ApplySubstitutions {
  static func applySubstitutions(_ replacements: [[String]], _ text: String) -> String {
    guard !text.isEmpty else { return text }
    
    var dict: [Character: String] = [:]
    for array in replacements {
      dict[Character(array[0])] = array[1]
    }
    
    var index = text.startIndex
    var text = text
    
    while index < text.endIndex {
      let char = text[index]
      let mid = text.index(after: index)
      guard mid < text.endIndex else { break }
      let last = text.index(after: mid)
      
      if char == "%", mid < text.endIndex, text[mid] != "_", last < text.endIndex, text[last] == "%" {
        let c = text[mid]
        let replacement = dict[c]!
        text.replaceSubrange(index...last, with: replacement)
      } else {
        index = text.index(after: index)
      }
    }
    
    return text
  }
}
