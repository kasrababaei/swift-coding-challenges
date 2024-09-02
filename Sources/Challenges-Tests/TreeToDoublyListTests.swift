import XCTest
@testable import Challenges

final class TreeToDoublyListTests: XCTestCase {
    private typealias Node = TreeToDoublyList.Node
    
    func testOnt() {
        let one = Node(1)
        let three = Node(3)
        let five = Node(5)
        let two = Node(2, one, three)
        let four = Node(4, two, five)
        
        let doublyLinkedNode = TreeToDoublyList.treeToDoublyList(four)
        
        var nodes: [Node] = []
        var node = doublyLinkedNode
        for _ in 0..<5 {
            nodes.append(node!)
            node = node?.right
        }
        
        XCTAssertEqual(nodes.map(\.val), [1,2,3,4,5])
        XCTAssertEqual(nodes.first?.left?.val, nodes.last?.val)
        XCTAssertEqual(nodes.last?.right?.val, nodes.first?.val)
    }
}
