import Testing
@testable import Challenges

struct ContainsDuplicateTests {
  @Test func caseOne() {
    #expect(ContainsDuplicate().containsDuplicate([1, 2, 3, 1]) == true)
  }
  
  @Test func caseTwo() {
    #expect(ContainsDuplicate().containsDuplicate([1, 2, 3, 4]) == false)
  }
  
  @Test func caseThree() {
    #expect(ContainsDuplicate().containsDuplicate([1, 1, 1, 3, 3, 4, 3, 2, 4, 2]) == true)
  }
}
