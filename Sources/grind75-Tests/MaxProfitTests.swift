import XCTest
@testable import grind75

final class MaxProfitTests: XCTestCase {
    func test() {
        XCTAssertEqual(MaxProfit.maxProfit([7,1,5,3,6,4]), 5)
        XCTAssertEqual(MaxProfit.maxProfit([7,6,4,3,1]), 0)
        XCTAssertEqual(MaxProfit.maxProfit([2,4,1]), 2)
        XCTAssertEqual(MaxProfit.maxProfit([2,4,1,5]), 4)
    }
}
