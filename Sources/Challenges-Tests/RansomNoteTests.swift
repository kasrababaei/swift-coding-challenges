import Testing
@testable import Challenges

struct RansomNoteTests {
  @Test func success() {
    #expect(RansomNote.canConstruct("apple", "baplnaanpae") == true)
    #expect(RansomNote.canConstruct("bananaz", String("bananaz".shuffled())) == true)
    #expect(RansomNote.canConstruct("a", "a") == true)
    #expect(RansomNote.canConstruct("ab", "aab") == true)
    #expect(RansomNote.canConstruct("aa", "aa") == true)
  }
    
  @Test func failure() {
    #expect(RansomNote.canConstruct("apple", "balnaanpae") == false)
    #expect(RansomNote.canConstruct("banana", String("baana".shuffled())) == false)
    #expect(RansomNote.canConstruct("a", "b") == false)
    #expect(RansomNote.canConstruct("ab", "aa") == false)
    #expect(RansomNote.canConstruct("aa", "a") == false)
  }
}
