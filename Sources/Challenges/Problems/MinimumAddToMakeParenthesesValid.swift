/*
 A parentheses string is valid if and only if:
 
 It is the empty string,
 It can be written as AB (A concatenated with B), where A and B are valid strings, or
 It can be written as (A), where A is a valid string.
 You are given a parentheses string s. In one move, you can insert a parenthesis at any position of the string.
 
 For example, if s = "()))", you can insert an opening parenthesis to be "(()))" or a closing parenthesis to be "())))".
 Return the minimum number of moves required to make s valid.
 
 
 
 Example 1:
 
 Input: s = "())"
 Output: 1
 Example 2:
 
 Input: s = "((("
 Output: 3
 */

class MinimumAddToMakeParenthesesValid {
    func minAddToMakeValid(_ s: String) -> Int {
        var matches = 0
        var unmatches = 0
        
        for char in s {
            switch char {
            case "(":
                matches += 1
            case ")" where matches == 0:
                unmatches += 1
            default:
                matches -= 1
            }
        }
        
        return matches + unmatches
    }
}
