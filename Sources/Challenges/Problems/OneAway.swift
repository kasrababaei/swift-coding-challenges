/// There are three types of edits that can be performed on strings: insert a character,
/// remove a character, or replace a character.  Given two strings, write a function to check if
/// they are one edit (or zero edit) away.
///
/// Examples:
/// pale, ple -> true
/// pales, pale -> true
/// pale, bale -> true
/// pale, bake -> false
/// payee, paee -> true

enum OneAway {
  static func oneAway(_ lhs: String, _ rhs: String) -> Bool {
    let diff = abs(lhs.count - rhs.count)
        
    guard diff < 2 else { return false }
        
    let lhs = lhs.count < rhs.count ? "\(lhs)*" : lhs
    let rhs = rhs.count < lhs.count ? "\(rhs)*" : rhs
        
    var mutationCount = 0
    var lhsIndex = lhs.startIndex
    var rhsIndex = rhs.startIndex
        
    while lhsIndex < lhs.endIndex, mutationCount < 2 {
      let matched = lhs[lhsIndex] == rhs[rhsIndex]
            
      lhsIndex = lhs.index(after: lhsIndex)
            
      if matched {
        rhsIndex = rhs.index(after: rhsIndex)
      } else {
        mutationCount += 1
        if diff == 0 {
          rhsIndex = rhs.index(after: rhsIndex)
        }
      }
    }
        
    return mutationCount < 2
  }
}
