//  There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1.
//  You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that you must
//  take course bi first if you want to take course ai.
//
//  For example, the pair [0, 1], indicates that to take course 0 you have to first take course 1.
//  Return true if you can finish all courses. Otherwise, return false.
//
//  Example 1:
//
//  Input: numCourses = 2, prerequisites = [[1,0]]
//  Output: true
//  Explanation: There are a total of 2 courses to take.
//  To take course 1 you should have finished course 0. So it is possible.
//  Example 2:
//
//  Input: numCourses = 2, prerequisites = [[1,0],[0,1]]
//  Output: false
//  Explanation: There are a total of 2 courses to take.
//  To take course 1 you should have finished course 0, and to take course 0 you should also have
//  finished course 1. So it is impossible.
//
//
//  Constraints:
//
//  1 <= numCourses <= 2000
//  0 <= prerequisites.length <= 5000
//  prerequisites[i].length == 2
//  0 <= ai, bi < numCourses
//  All the pairs prerequisites[i] are unique.
//  https://www.youtube.com/watch?v=EUDwWbvtB_Q

enum CanFinish {
  static func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    // A topological sort or topological ordering of a directed graph is a linear ordering of its
    // vertices such that for every directed edge u -> v from vertex u to vertex v, u comes before v
    // in the ordering.
    
    // We can use Kahn's algorithm
    
    // Indegree: number of incoming edges of a node. Zero indegree means no incoming edge to this node.
    var indegrees = Array(repeating: 0, count: numCourses)
    var adjs = Array(repeating: [Int](), count: numCourses)
    
    for preq in prerequisites {
      indegrees[preq[0]] += 1 // no. of times this node is visited
      adjs[preq[1]].append(preq[0]) // neighbours, i.e., nodes that have an incoming from preq[1]
    }
    
    // Start with nodes that have no incoming (a BFS search).
    var queue = indegrees.enumerated().filter { $0.1 == 0 }.map { $0.0 }
    var numberOfVisits = 0
    
    while !queue.isEmpty {
      let course = queue.removeFirst()
      numberOfVisits += 1
      
      // nodes that have an incoming edge from course
      for c in adjs[course] {
        indegrees[c] -= 1
        if indegrees[c] == 0 { // This behaves like a leaf node
          queue.append(c)
        }
      }
    }
    
    return numberOfVisits == numCourses
  }
}
