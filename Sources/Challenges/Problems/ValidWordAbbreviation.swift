/*
 A string can be abbreviated by replacing any number of non-adjacent, non-empty substrings with their lengths. The lengths should not have leading zeros.

 For example, a string such as "substitution" could be abbreviated as (but not limited to):

 "s10n" ("s ubstitutio n")
 "sub4u4" ("sub stit u tion")
 "12" ("substitution")
 "su3i1u2on" ("su bst i t u ti on")
 "substitution" (no substrings replaced)
 The following are not valid abbreviations:

 "s55n" ("s ubsti tutio n", the replaced substrings are adjacent)
 "s010n" (has leading zeros)
 "s0ubstitution" (replaces an empty substring)
 Given a string word and an abbreviation abbr, return whether the string matches the given abbreviation.

 A substring is a contiguous non-empty sequence of characters within a string.

 Example 1:

 Input: word = "internationalization", abbr = "i12iz4n"
 Output: true
 Explanation: The word "internationalization" can be abbreviated as "i12iz4n" ("i nternational iz atio n").
 Example 2:

 Input: word = "apple", abbr = "a2e"
 Output: false
 Explanation: The word "apple" cannot be abbreviated as "a2e".

 Constraints:

 1 <= word.length <= 20
 word consists of only lowercase English letters.
 1 <= abbr.length <= 10
 abbr consists of lowercase English letters and digits.
 All the integers in abbr will fit in a 32-bit integer.
 */

enum ValidWordAbbreviation {
  static func validWordAbbreviation(_ word: String, _ abbr: String) -> Bool {
    guard word != abbr else { return true }
        
    // "12" ("substitution")
    // "012" ("substitution")
    if let number = Int(abbr) {
      return number == word.count && !abbr.hasPrefix("0")
    }
        
    var numberToken = ""
    var substringToken = ""
        
    var substrings: [String] = []
        
    for (index, char) in Array(abbr).enumerated() {
      if Int("\(char)") != nil {
        // it's a number
                
        numberToken += "\(char)"
                
        // was scanning chars
        if !substringToken.isEmpty {
          substrings.append(substringToken)
          substringToken = ""
        }
      } else {
        // it's not a number
        substringToken += "\(char)"
                
        // was scanning numbers
        if !numberToken.isEmpty {
          substrings.append(numberToken)
          numberToken = ""
        }
      }
            
      if index == abbr.count - 1 {
        substrings.append(numberToken)
        substrings.append(substringToken)
      }
    }
        
    var sum = 0
    var hasInvalidSubstring = false
        
    for substring in substrings where !substring.isEmpty {
      guard !substring.hasSuffix("0") else {
        hasInvalidSubstring = true
        break
      }
            
      if let number = Int("\(substring)") {
        sum += number
      } else {
        guard word.range(of: substring) != nil else {
          hasInvalidSubstring = false
          break
        }
                
        sum += substring.count
      }
    }
        
    let output = hasInvalidSubstring ? false : sum == word.count
    return output
  }
    
  static func test() {
    print("internationalization", validWordAbbreviation("internationalization", "i12iz4n") == true)
    print("apple", validWordAbbreviation("apple", "a2e") == false)
    print("substitution", validWordAbbreviation("substitution", "s10n") == true)
    print("substitution", validWordAbbreviation("substitution", "sub4u4") == true)
    print("substitution", validWordAbbreviation("substitution", "12") == true)
    print("substitution", validWordAbbreviation("substitution", "su3i1u2on") == true)
    print("substitution", validWordAbbreviation("substitution", "substitution") == true)
    print("word", validWordAbbreviation("word", "w02d") == false)
    print("word", validWordAbbreviation("word", "3e") == false)
    print("hi", validWordAbbreviation("hi", "1i") == true)
    print("hi", validWordAbbreviation("hi", "h01") == true)
  }
}
