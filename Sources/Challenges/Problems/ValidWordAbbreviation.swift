import Foundation

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
