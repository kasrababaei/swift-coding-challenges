//  You are given two integer arrays nums1 and nums2 sorted in non-decreasing order and an integer k.
//
//  Define a pair (u, v) which consists of one element from the first array and one element from
// the second array.
//
//  Return the k pairs (u1, v1), (u2, v2), ..., (uk, vk) with the smallest sums.
//
//
//
//  Example 1:
//
//  Input: nums1 = [1,7,11], nums2 = [2,4,6], k = 3
//  Output: [[1,2],[1,4],[1,6]]
//  Explanation: The first 3 pairs are returned from the sequence: [1,2],[1,4],[1,6],[7,2],[7,4],[11,2],[7,6],[11,4],[11,6]
//  Example 2:
//
//  Input: nums1 = [1,1,2], nums2 = [1,2,3], k = 2
//  Output: [[1,1],[1,1]]
//  Explanation: The first 2 pairs are returned from the sequence: [1,1],[1,1],[1,2],[2,1],[1,2],[2,2],[1,3],[1,3],[2,3]
//
//
//  Constraints:
//
//  1 <= nums1.length, nums2.length <= 105
//  -109 <= nums1[i], nums2[i] <= 109
//  nums1 and nums2 both are sorted in non-decreasing order.
//  1 <= k <= 104
//  k <= nums1.length * nums2.length

enum KSmallestPairs {
  static func kSmallestPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {
    if nums1.isEmpty || nums2.isEmpty { return [] }
    
    var heap = MinMaxHeap<Pair> { $0 < $1 }
    for index in 0..<min(k, nums1.count) {
      heap.insert(Pair(i: index, j: 0, sum: nums1[index] + nums2[0]))
    }
    
    var result: [[Int]] = []
    while result.count < k, !heap.storage.isEmpty {
      let popped = heap.pop()!
      result.append([nums1[popped.i], nums2[popped.j]])
      
      if popped.j + 1 < nums2.count {
        heap.insert(Pair(i: popped.i, j: popped.j + 1, sum: nums1[popped.i] + nums2[popped.j + 1]))
      }
    }
    return result
  }
}

private struct Pair: Comparable {
  let i: Int
  let j: Int
  let sum: Int
  
  static func < (lhs: Pair, rhs: Pair) -> Bool {
    lhs.sum < rhs.sum
  }
}

private struct MinMaxHeap<T> {
  var storage: [T] = []
  let sort: (T, T) -> Bool
  
  @discardableResult
  mutating func pop() -> T? {
    guard !storage.isEmpty else { return nil }
    
    storage.swapAt(0, storage.count - 1)
    let element = storage.removeLast()
    shiftDown(index: 0)
    
    return element
  }
  
  mutating func insert(_ value: T) {
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
