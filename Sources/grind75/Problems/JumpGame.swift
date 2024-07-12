/*
 https://leetcode.com/problems/jump-game/description/
 
 You are given an integer array nums. You are initially positioned at the array's first index, and
 each element in the array represents your maximum jump length at that position.

 Return true if you can reach the last index, or false otherwise.

  

 Example 1:

 Input: nums = [2,3,1,1,4]
 Output: true
 Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
 Example 2:

 Input: nums = [3,2,1,0,4]
 Output: false
 Explanation: You will always arrive at index 3 no matter what. Its maximum jump length is 0, which 
 makes it impossible to reach the last index.
 
 */

import Foundation

struct JumpGame {
    func canJump(_ nums: [Int]) -> Bool {
        var canJump = true
        var requiredJumps = 1
        
        for i in stride(from: nums.count - 2, through: 0, by: -1) {
            guard (nums.count > 1) else { break }
            if (nums[i] >= requiredJumps) {
                canJump = true
                requiredJumps = 1
            } else {
                canJump = false
                requiredJumps += 1
            }
        }
        
        return canJump
    }
}
