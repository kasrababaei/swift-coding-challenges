/*
 Given two strings ransomNote and magazine, return true if ransomNote can be constructed by using
 the letters from magazine and false otherwise.

 Each letter in magazine can only be used once in ransomNote.

 Example 1:

 Input: ransomNote = "a", magazine = "b"
 Output: false
 Example 2:

 Input: ransomNote = "aa", magazine = "ab"
 Output: false
 Example 3:

 Input: ransomNote = "aa", magazine = "aab"
 Output: true
  
 Constraints:
 1 <= ransomNote.length, magazine.length <= 105
 ransomNote and magazine consist of lowercase English letters.
 */

enum RansomNote {
    static func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var array = Array(repeating: 0, count: Int("z".utf8CString[0]) + 1)
        
        for char in magazine.utf8CString {
            array[Int(char)] += 1
        }
        
        for char in ransomNote.utf8CString {
            guard array[Int(char)] != 0 else { return false }
            array[Int(char)] -= 1
        }
        
        return true
    }
}
