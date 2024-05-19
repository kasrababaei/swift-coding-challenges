import XCTest
@testable import grind75

final class MyPowTests: XCTestCase {
    func testOne() {
        XCTAssertEqual(MyPow.myPow(2.0000, 10), 1024.00000)
        XCTAssertEqual(MyPow.myPow(2.10000, 3), 9.26100, accuracy: 5)
        XCTAssertEqual(MyPow.myPow(2.00000, -2), 0.25000)
        XCTAssertEqual(MyPow.myPow(1.00000, -2147483648), 1.00000)
    }
}
