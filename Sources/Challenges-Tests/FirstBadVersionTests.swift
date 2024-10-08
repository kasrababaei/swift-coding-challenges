import Testing
@testable import Challenges

struct FirstBadVersionTests {
  @Test func firstBadVersionFour() async throws {
    let model = FirstBadVersion(badVersion: 4)
    #expect(model.firstBadVersion(5) == 4)
  }
    
  @Test func firstBadVersionFourPrime() async throws {
    let model = FirstBadVersion(badVersion: 4)
    #expect(model.firstBadVersion(4) == 4)
  }
    
  @Test func firstBadVersionOne() async throws {
    let model = FirstBadVersion(badVersion: 1)
    #expect(model.firstBadVersion(1) == 1)
  }
    
  @Test func firstBadVersionTwo() async throws {
    let model = FirstBadVersion(badVersion: 2)
    #expect(model.firstBadVersion(2) == 2)
  }
}
