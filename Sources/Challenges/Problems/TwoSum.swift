/*
 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

 You may assume that each input would have exactly one solution, and you may not use the same element twice.

 You can return the answer in any order.

 Example 1:

 Input: nums = [2,7,11,15], target = 9
 Output: [0,1]
 Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
 Example 2:

 Input: nums = [3,2,4], target = 6
 Output: [1,2]
 Example 3:

 Input: nums = [3,3], target = 6
 Output: [0,1]

 Constraints:

 2 <= nums.length <= 104
 -109 <= nums[i] <= 109
 -109 <= target <= 109
 Only one valid answer exists.

 Follow-up: Can you come up with an algorithm that is less than O(n2) time complexity?
 */
enum TwoSum {
  static func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var dict: [Int: Int] = [:]
    var indices: [Int] = []
        
    for (index, element) in nums.enumerated() {
      dict[index] = element
            
      guard dict.count > 1 else { continue }
            
      let diff = target - element
      if let secondIndex = dict.first(where: { $0.value == diff && $0.key != index })?.key {
        indices = [index, secondIndex]
        break
      }
    }
        
    return indices
  }
    
  static func test() {
    [
      ([2, 7, 11, 15], 9, [0, 1]),
      ([3, 2, 4], 6, [1, 2]),
      ([3, 3], 6, [0, 1])
    ].forEach { assert(nums: $0.0, target: $0.1, answer: $0.2) }
  }
    
  static func assert(nums: [Int], target: Int, answer: [Int]) {
    let result = twoSum(nums, target)
    print(result, answer, answer.allSatisfy { answer.contains($0) })
  }
}
