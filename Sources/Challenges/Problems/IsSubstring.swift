/*
 Given two strings, see if one is a permutation of the other one.
 Example: waterbottle is a rotation of erbottlewat
          what is rotation of tahw
 */

enum IsSubstring {
    static func isSubstring(_ s1: String, _ s2: String) -> Bool {
        guard s1.count == s2.count else { return false }
        
        var dict = [Character: Int]()
        
        var index = s1.startIndex
        
        while index < s1.endIndex {
            let char1 = s1[index]
            let char2 = s2[index]
            index = s1.index(after: index)
            
            guard char1 != char2 else { continue }
            
            if dict[char1] != nil {
                dict[char1]! -= 1
                if dict[char1] == 0 {
                    dict.removeValue(forKey: char1)
                }
            } else {
                dict[char1, default: 0] += 1
            }
            
            if dict[char2] != nil {
                dict[char2]! -= 1
                if dict[char2] == 0 {
                    dict.removeValue(forKey: char2)
                }
            } else {
                dict[char2, default: 0] += 1
            }
        }
        
        return dict.isEmpty
    }
}
