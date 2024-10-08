/*
 You are given two lists of closed intervals, firstList and secondList, where firstList[i] = [starti, endi] and secondList[j] = [startj, endj]. Each list of intervals is pairwise disjoint and in sorted order.

 Return the intersection of these two interval lists.

 A closed interval [a, b] (with a <= b) denotes the set of real numbers x with a <= x <= b.

 The intersection of two closed intervals is a set of real numbers that are either empty or represented as a closed interval. For example, the intersection of [1, 3] and [2, 4] is [2, 3].

 Input: firstList = [[0,2],[5,10],[13,23],[24,25]], secondList = [[1,5],[8,12],[15,24],[25,26]]
 Output: [[1,2],[5,5],[8,10],[15,23],[24,24],[25,25]]
 Example 2:

 Input: firstList = [[1,3],[5,9]], secondList = []
 Output: []
 
  Constraints:

  0 <= firstList.length, secondList.length <= 1000
  firstList.length + secondList.length >= 1
  0 <= starti < endi <= 109
  endi < starti+1
  0 <= startj < endj <= 109
  endj < startj+1
 
 */

enum IntervalIntersection {
  static func intervalIntersection(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
    var intersections: [[Int]] = []
    var leadIndex = 0
    var trailIndex = 0
        
    while leadIndex < firstList.endIndex, trailIndex < secondList.endIndex {
      let first = firstList[leadIndex]
      let second = secondList[trailIndex]
            
      let lowerBound = max(first[0], second[0])
      let upperBound = min(first[1], second[1])
            
      if upperBound >= lowerBound {
        intersections.append([lowerBound, upperBound])
        if first[1] < second[1] {
          leadIndex += 1
        } else {
          trailIndex += 1
        }
      } else {
        if first[0] > second[1] {
          trailIndex += 1
        } else {
          leadIndex += 1
        }
      }
    }
        
    return intersections
  }
}
