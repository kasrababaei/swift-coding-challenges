import Testing
@testable import Challenges

struct ValidPalindromeTests {
  @Test func caseOne() async throws {
    #expect(ValidPalindrome().isPalindrome("A man, a plan, a canal: Panama") == true)
  }
  
  @Test func caseTwo() async throws {
    #expect(ValidPalindrome().isPalindrome("race a car") == false)
  }
  
  @Test func caseThree() async throws {
    #expect(ValidPalindrome().isPalindrome(" ") == true)
  }
}
