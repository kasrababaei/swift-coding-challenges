import Testing
@testable import Challenges

struct RansomNoteTests {
  @Test func success() async throws {
    #expect(RansomNote.canConstruct("apple", "baplnaanpae") == true)
    #expect(RansomNote.canConstruct("banana", String("banana".shuffled())) == true)
    #expect(RansomNote.canConstruct("a", "a") == true)
    #expect(RansomNote.canConstruct("ab", "aab") == true)
    #expect(RansomNote.canConstruct("aa", "aa") == true)
  }
    
  @Test func failure() async throws {
    #expect(RansomNote.canConstruct("apple", "balnaanpae") == false)
    #expect(RansomNote.canConstruct("banana", String("baana".shuffled())) == false)
    #expect(RansomNote.canConstruct("a", "b") == false)
    #expect(RansomNote.canConstruct("ab", "aa") == false)
    #expect(RansomNote.canConstruct("aa", "a") == false)
  }
}
