// Implement an algorithm to determine if a string has all unique characters. What if you cannot
// use additional data structure?

// Notes:
// Must ask if the string is an ASCII string or a Unicode string.
// ASCII has just 128 code points, of which only 95 are printable characters
// Unicode v6 has 154,998 characters

enum OnlyUniqueCharacters {
    static func isUnique(_ string: String) -> Bool {
        guard string.count <= 128 else {
            return false
        }
        
        var array = Array(repeating: false, count: 128)
        
        for char in string {
            let asciiIndex = Int(char.asciiValue!)
            guard array[asciiIndex] == false else {
                return false
            }
            array[asciiIndex] = true
        }
        
        return true
    }
}
