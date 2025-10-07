import Testing
@testable import Challenges

struct CountAndSayTests {
  @Test func countAndSay() async throws {
    #expect(CountAndSay.countAndSay(1) == "1")
    #expect(CountAndSay.countAndSay(2) == "11")
    #expect(CountAndSay.countAndSay(3) == "21")
    #expect(CountAndSay.countAndSay(4) == "1211")
  }
}
