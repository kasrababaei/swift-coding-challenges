// Given two strings, write a method to decide if one is a permutation of the other

// Notes:
// We should understand if the permutation comparison is case sensitive. Additionally, we should
// ask if whitespace is significant.

// For this problem, the comparison is case sensitive and whitespace is significant.

enum PermutationStrings {
  static func isPermutation(_ a: String, _ b: String) -> Bool {
    let a = String(a.sorted())
    let b = String(b.sorted())
    let result = a.localizedCompare(b)
        
    return result == .orderedSame
  }
}
