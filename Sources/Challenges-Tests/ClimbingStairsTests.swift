import Testing
@testable import Challenges

struct ClimbingStairsTests {
  @Test func caseOne() {
    #expect(ClimbingStairs().climbStairs(2) == 2)
  }
  
  @Test func caseTwo() {
    #expect(ClimbingStairs().climbStairs(3) == 3)
  }
  
  @Test func caseThree() {
    #expect(ClimbingStairs().climbStairs(4) == 5)
  }
  
  @Test func caseFour() {
    #expect(ClimbingStairs().climbStairs(5) == 8)
  }
  
  @Test func caseFive() {
    #expect(ClimbingStairs().climbStairs(6) == 13)
  }
  
  @Test func caseSix() {
    #expect(ClimbingStairs().climbStairs(1) == 1)
  }
  
  @Test func caseSeven() {
    #expect(ClimbingStairs().climbStairs(2) == 2)
  }
  
  @Test func caseEight() {
    #expect(ClimbingStairs().climbStairs(3) == 3)
  }
}
