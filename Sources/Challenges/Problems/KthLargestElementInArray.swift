/*
 Given an integer array nums and an integer k, return the kth largest element in the array.

 Note that it is the kth largest element in the sorted order, not the kth distinct element.

 Can you solve it without sorting?

 Example 1:

 Input: nums = [3,2,1,5,6,4], k = 2
 Output: 5
 Example 2:

 Input: nums = [3,2,3,1,2,4,5,5,6], k = 4
 Output: 4
  
 Constraints:

 1 <= k <= nums.length <= 105
 -104 <= nums[i] <= 104
 */

enum KthLargestElementInArray {
  static func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    var heap = MinMaxHeap()
    for value in nums {
      heap.insert(value)
      if heap.storage.count > k {
        heap.popLast()
      }
    }
    return heap.storage.first!
  }
  
  static func _findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    var queue: [Int] = []
        
    for number in nums {
      guard queue.endIndex > 0 else {
        queue.append(number)
        continue
      }
            
      guard queue.last! < number || queue.count < k else {
        continue
      }
            
      if let index = queue.firstIndex(where: { $0 <= number }) {
        queue.insert(number, at: index)
        if queue.endIndex > k {
          queue.removeLast()
        }
      } else {
        queue.append(number)
      }
    }
        
    return queue[k - 1]
  }
}

private struct MinMaxHeap {
  var storage: [Int] = []
  let sort: (Int, Int) -> Bool = { $0 < $1 }
  @discardableResult
  mutating func popLast() -> Int? {
    guard !storage.isEmpty else { return nil }
        
    storage.swapAt(0, storage.count - 1)
    let element = storage.removeLast()
    shiftDown(index: 0)

    return element
  }

  mutating func insert(_ value: Int) {
    storage.append(value)
    shiftUp()
  }

  mutating func shiftUp() {
    var index = storage.count - 1
    var parentIndex = parent(of: index)

    while index > 0, sort(storage[index], storage[parentIndex]) {
      storage.swapAt(index, parentIndex)
      index = parentIndex
      parentIndex = parent(of: index)
    }
  }

  mutating func buildUp() {
    for i in stride(from: storage.count - 2, through: 0, by: -1) {
      shiftDown(index: i)
    }
  }

  mutating func shiftDown(index: Int) {
    var _index = index
    let leftIndex = leftChild(of: index)
    let rightIndex = rightChild(of: index)
            
    if leftIndex < storage.count, sort(storage[leftIndex], storage[_index]) {
      _index = leftIndex
    }
            
    if rightIndex < storage.count, sort(storage[rightIndex], storage[_index]) {
      _index = rightIndex
    }
            
    guard _index != index else { return }
            
    storage.swapAt(index, _index)
    shiftDown(index: _index)
  }

  func leftChild(of index: Int) -> Int { index * 2  + 1 }
  func rightChild(of index: Int) -> Int { index * 2  + 2 }
  func parent(of index: Int) -> Int { (index - 1) / 2 }
}
