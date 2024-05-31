import XCTest
@testable import grind75

final class LRUCacheTests: XCTestCase {
    func test() {
        let lruCache = LRUCache(2)
        
        lruCache.put(1, 1)
        lruCache.put(2, 2)
        XCTAssertEqual(lruCache.get(1), 1)
        lruCache.put(3, 3)
        XCTAssertEqual(lruCache.get(2), -1)
        lruCache.put(4, 4)
        XCTAssertEqual(lruCache.get(1), -1)
        XCTAssertEqual(lruCache.get(3), 3)
        XCTAssertEqual(lruCache.get(4), 4)
    }
}
