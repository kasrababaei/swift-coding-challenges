import XCTest
@testable import Challenges

final class OneAwayTests: XCTestCase {
  func testPale() {
    XCTAssertTrue(OneAway.oneAway("pale", "ple"))
  }
    
  func testPales() {
    XCTAssertTrue(OneAway.oneAway("pales", "pale"))
  }
    
  func testBale() {
    XCTAssertTrue(OneAway.oneAway("pale", "bale"))
  }
    
  func testBake() {
    XCTAssertFalse(OneAway.oneAway("pale", "bake"))
  }
    
  func testPayee() {
    XCTAssertTrue(OneAway.oneAway("paye", "payee"))
  }
    
  func testPeaks() {
    XCTAssertFalse(OneAway.oneAway("peaks", "geeks"))
  }
    
  func testApple() {
    XCTAssertTrue(OneAway.oneAway("apple", "aple"))
  }
}
