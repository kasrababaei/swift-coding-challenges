import XCTest
@testable import Challenges

final class ListNodeTests: XCTestCase {
    func testFlatten() {
        let array = [1, 9, 4, 6, 2, 7, 5]
        let list = ListNode(array)
        
        XCTAssertEqual(list.flatten(), array)
        
        XCTAssertEqual(ListNode([]).flatten(), [])
    }
    
    func testAddAtHead() {
        let list = ListNode()
        list.addAtHead(1)
        
        XCTAssertEqual(list.flatten(), [1])
    }
    
    func testAddAtTail() {
        let list = ListNode(1)
        list.addAtTail(3)
        
        XCTAssertEqual(list.flatten(), [1, 3])
    }
    
    func testAddAtIndex() {
        let list = ListNode([1, 3])
        list.addAtIndex(1, 2)
        
        XCTAssertEqual(list.flatten(), [1, 2, 3])
    }
    
    func testDeleteAtIndex() {
        let list = ListNode([1, 2, 3])
        list.deleteAtIndex(1)
        
        XCTAssertEqual(list.flatten(), [1, 3])
    }
    
    func testMixedOperationsOne() {
        let list = ListNode();
        XCTAssertEqual(list.flatten(), [])
        
        list.addAtHead(1);
        XCTAssertEqual(list.flatten(), [1])
        
        list.addAtTail(3);
        XCTAssertEqual(list.flatten(), [1, 3])
        
        list.addAtIndex(1, 2);
        XCTAssertEqual(list.flatten(), [1, 2, 3])
        
        XCTAssertEqual(list.get(1), 2)
        
        list.deleteAtIndex(1);
        XCTAssertEqual(list.flatten(), [1, 3])
        
        XCTAssertEqual(list.get(1), 3)
    }
    
    func testMixedOperationsTwo() {
        let list = ListNode()
        XCTAssertEqual(list.flatten(), [])
        
        list.addAtHead(7)
        XCTAssertEqual(list.flatten(), [7])
        
        list.addAtHead(2)
        XCTAssertEqual(list.flatten(), [2, 7])
        
        XCTAssertEqual(list.get(1), 7)
        
        list.addAtHead(1)
        XCTAssertEqual(list.flatten(), [1, 2, 7])
        
        list.addAtIndex(3, 0)
        XCTAssertEqual(list.flatten(), [1, 2, 7])
        
        list.deleteAtIndex(2)
        XCTAssertEqual(list.flatten(), [1, 2])
        
        list.addAtHead(6)
        XCTAssertEqual(list.flatten(), [6, 1, 2])
        
        list.addAtTail(4)
        XCTAssertEqual(list.flatten(), [6, 1, 2, 4])
        
        XCTAssertEqual(list.get(4), -1)
        
        list.addAtHead(4)
        XCTAssertEqual(list.flatten(), [4, 6, 1, 2, 4])
        
        list.addAtIndex(5, 0)
        XCTAssertEqual(list.flatten(), [4, 6, 1, 2, 4])
        
        list.addAtHead(6)
        XCTAssertEqual(list.flatten(), [6, 4, 6, 1, 2, 4])
    }
}
