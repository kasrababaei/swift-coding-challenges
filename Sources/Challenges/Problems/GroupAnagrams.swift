//  Given an array of strings strs, group the anagrams together. You can return the answer in any order.
//
//
//
//  Example 1:
//
//  Input: strs = ["eat","tea","tan","ate","nat","bat"]
//
//  Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
//
//  Explanation:
//
//  There is no string in strs that can be rearranged to form "bat".
//  The strings "nat" and "tan" are anagrams as they can be rearranged to form each other.
//  The strings "ate", "eat", and "tea" are anagrams as they can be rearranged to form each other.
//  Example 2:
//
//  Input: strs = [""]
//
//  Output: [[""]]
//
//  Example 3:
//
//  Input: strs = ["a"]
//
//  Output: [["a"]]
//
//
//
//  Constraints:
//
//  1 <= strs.length <= 104
//  0 <= strs[i].length <= 100
//  strs[i] consists of lowercase English letters.

import Foundation

enum GroupAnagrams {
  // This could also be done by sorting the word, and use the sorted word as the dict's key.
  
  static func groupAnagrams(_ strs: [String]) -> [[String]] {
    guard strs.count > 1 else {
      return [strs]
    }
    
    var dict: [[UInt8]: [String]] = [:]
    
    for word in strs {
      var index = Array(repeating: UInt8(0), count: Int("z".first!.asciiValue!) + 1)
      word.forEach { index[Int($0.asciiValue!)] += 1 }
      dict[index, default: []].append(word)
    }
    
    return Array(dict.values)
  }
}
