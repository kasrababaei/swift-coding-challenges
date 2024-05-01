/*
 Given a string s which represents an expression, evaluate this expression and return its value.

 The integer division should truncate toward zero.

 You may assume that the given expression is always valid. All intermediate results will be in the range of [-231, 231 - 1].

 Note: You are not allowed to use any built-in function which evaluates strings as mathematical expressions, such as eval().

  

 Example 1:

 Input: s = "3+2*2"
 Output: 7
 Example 2:

 Input: s = " 3/2 "
 Output: 1
 Example 3:

 Input: s = " 3+5 / 2 "
 Output: 5
  

 Constraints:

 1 <= s.length <= 3 * 105
 s consists of integers and operators ('+', '-', '*', '/') separated by some number of spaces.
 s represents a valid expression.
 All the integers in the expression are non-negative integers in the range [0, 231 - 1].
 The answer is guaranteed to fit in a 32-bit integer.
 */

import Foundation

class SimpleCalculator {
    func calculate(_ s: String) -> Int {
        var sum = 0
        var lValue = 0
        var rValue = 0
        var operation: Character = "+"
        
        for char in s+"+" where !char.isNewline && !char.isWhitespace {
            if let digit = char.wholeNumberValue {
                rValue = rValue * 10 + digit
            } else {
                switch operation {
                case "*":
                    lValue = lValue * rValue
                case "/":
                    lValue = lValue / rValue
                case "+":
                    sum += lValue
                    lValue = rValue
                default:
                    sum += lValue
                    lValue = -rValue
                }
                
                rValue = 0
                operation = char
            }
        }
        
        return sum + lValue
    }
    
    static func test() {
        [
            ("3+2*2", 7),
            (" 3/2 ", 1),
            (" 3+5 / 2 ", 5),
            (" \n3+5 / 2 ", 5),
            ("2*3*4", 24),
            ("1+2*5/3+6/4*2", 6)
        ].forEach { pair in
            let result = SimpleCalculator().calculate(pair.0)
            
            if result == pair.1 {
                print(true)
            } else {
                print("Expected \(pair.1) but got \(result)")
            }
        }
    }
}
