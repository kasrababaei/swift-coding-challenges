import Testing
@testable import Challenges

struct MajorityElementTests {
  @Test func caseOne() async throws {
    #expect(MajorityElement().majorityElement([3, 2, 3]) == 3)
  }
  
  @Test func caseTwo() async throws {
    #expect(MajorityElement().majorityElement([2, 2, 1, 1, 1, 2, 2]) == 2)
  }
  
  @Test func caseThree() async throws {
    #expect(MajorityElement().majorityElement([6, 5, 5]) == 5)
  }
}
