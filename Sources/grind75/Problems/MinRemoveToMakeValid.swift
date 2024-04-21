import Foundation

enum MinRemoveToMakeValid {
    static func minRemoveToMakeValid(_ s: String) -> String {
        var stack: [Int] = []
        var characters = Array(s)
        
        for (index, char) in characters.enumerated() {
            if char == "(" {
                stack.append(index)
            } else if char == ")" {
                if stack.isEmpty {
                    characters[index] = "*"
                } else {
                    stack.removeLast()
                }
            }
        }
        
        for index in stack {
            characters[index] = "*"
        }
        
        return characters.filter { $0 != "*" }.reduce(into: "") { $0 += "\($1)" }
    }
    
    static func test() {
        print("lee(t(c)o)de)", minRemoveToMakeValid("lee(t(c)o)de)") == "lee(t(c)o)de")
        print("a)b(c)d", minRemoveToMakeValid("a)b(c)d") == "ab(c)d")
        print("))((", minRemoveToMakeValid("))((") == "")
        print("(a(b(c)d)", minRemoveToMakeValid("(a(b(c)d)") == "a(b(c)d)")
        print("()()", minRemoveToMakeValid("()()") == "()()")
        print("())()(((", minRemoveToMakeValid("())()(((") == "()()")
    }
}
