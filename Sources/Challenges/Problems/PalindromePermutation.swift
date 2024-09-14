// Given a string, write a function to check if it is a permutation of a palindrome.
// A palindrome is a word or phrase.

// Notes:
// Strings with even length (after removing all non-letters characters) must have all even counts of
// characters.
// Strings of an odd length must have exactly one character with an odd count.

enum PalindromePermutation {
    static func isPalindromePermutation(_ string: String) -> Bool {
        var dict: [String: Int] = [:]
        
        for char in string {
            guard !char.isWhitespace else { continue }
            
            // Another approach to make it case insensitive is to map characters to numbers.
            let count = dict[char.lowercased(), default: 0]
            dict[char.lowercased()] = count + 1
        }
        
        var foundOdd = false
        
        for value in dict.values {
            if !value.isMultiple(of: 2) {
                guard !foundOdd else { return false }
                foundOdd = true
            }
        }
        
        return true
    }
}
