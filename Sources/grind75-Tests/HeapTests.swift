import XCTest
@testable import grind75

final class HeapTests: XCTestCase {
    func testMinMaxHeapOrdering() {
        let input = [1, 2, 9, 4, 2, 12, 1, 8, 43, 17]
        let expected = [1, 1, 2, 2, 4, 8, 9, 12, 17, 43]
        
        var heap = Heap(input, sort: <)
        var output: [Int] = []
        
        while !heap.isEmpty {
            output.append(heap.remove()!)
        }
        
        XCTAssertEqual(output, expected)
    }
    
    func testPeak() {
        let input = [13, 2, 9, 4, 2, 12, 1, 8, 43, 17]
        
        let minHeap = Heap(input, sort: <)
        XCTAssertEqual(minHeap.peek(), 1)
        
        let maxHeap = Heap(input, sort: >)
        XCTAssertEqual(maxHeap.peek(), 43)
    }
    
    func testMinMaxInsert() {
        let input = [13, 2, 9, 4, 2, 12, 1, 8, 43, 17]
        var heap = Heap(input, sort: <)
        heap.insert(5)
        var output: [Int] = []
        
        while !heap.isEmpty {
            output.append(heap.remove()!)
        }
        XCTAssertEqual(output, [1, 2, 2, 4, 5, 8, 9, 12, 13, 17, 43])
    }
    
    func testMaxMinInsert() {
        let input = [13, 2, 9, 4, 2, 12, 1, 8, 43, 17]
        var heap = Heap(input, sort: >)
        heap.insert(5)
        var output: [Int] = []
        
        while !heap.isEmpty {
            output.append(heap.remove()!)
        }
        XCTAssertEqual(output, [43, 17, 13, 12, 9, 8, 5, 4, 2, 2, 1])
    }
    
    func testMinMaxRemove() {
        let input = [13, 2, 9, 4, 2, 12, 1, 8, 43, 17]
        var heap = Heap(input, sort: <)
        let expected = heap.peek()
        let output = heap.remove()
        
        XCTAssertEqual(output, expected)
    }
    
    func testMaxMinRemove() {
        let input = [13, 2, 9, 4, 2, 12, 1, 8, 43, 17]
        var heap = Heap(input, sort: >)
        let expected = heap.peek()
        let output = heap.remove()
        
        XCTAssertEqual(output, expected)
    }
    
    func testMaxMinHeapOrdering() {
        let input = [1, 2, 9, 4, 2, 12, 1, 8, 43, 17]
        let expected = [43, 17, 12, 9, 8, 4, 2, 2, 1, 1]
        
        var heap = Heap(input, sort: >)
        var output: [Int] = []
        
        while !heap.isEmpty {
            output.append(heap.remove()!)
        }
        
        XCTAssertEqual(output, expected)
    }
    
    func testLevel() {
        let input = [5, 10, 8, 12, 11, 14, 13, 22, 43]
        let heap = Heap(input, sort: <)
        
        XCTAssertEqual(heap.level(ofValue: 5), 0)
        XCTAssertEqual(heap.level(ofValue: 8), 1)
        XCTAssertEqual(heap.level(ofValue: 12), 2)
        XCTAssertEqual(heap.level(ofValue: 22), 3)
    }
}
