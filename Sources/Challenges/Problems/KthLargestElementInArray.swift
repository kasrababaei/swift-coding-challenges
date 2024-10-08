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
