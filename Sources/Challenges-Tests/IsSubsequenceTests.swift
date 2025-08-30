import Testing
@testable import Challenges

struct IsSubsequenceTests {
  @Test func isSubsequence() {
    let inputs = [
      ("abc", "ahbgdc", true),
      ("axc", "ahbgdc", false),
      ("abc", "ahbgdccc", true),
      ("acb", "ahbgdc", false)
    ]
    
    for (s, t, bool) in inputs {
      #expect(IsSubsequence.isSubsequence(s, t) == bool)
    }
  }
}
