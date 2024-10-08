enum KthLargestElementInArray {
  static func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
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
