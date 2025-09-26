// Solve this problem using Swift programming language:

// PROBLEM : Given data about users, action and time of action, convert the given data in a table
// like format into a structure that can help identify customer dropoff.
// You can use any data structure for input and output.

// INPUT DATA
// USER TIME ACTION
// 100 1000 A
// 200 1000 A
// 100 1100 B
// 200 1150 B
// 200 1200 C
// 100 1200 A
// 300 1500 B
// 300 1600 B
// 400 1700 B

// EXPECTED OUTPUT
// A (2)
// -> B (2)
// -> C (1)
// -> A (1)
// B (2)
// -> B (1)

// I think the problem is asking us to identify where users drop off in a customer journey (i.e. if
// they do not have a next action) or if they loop back, by visualizing transitions from each action step

// A (2): Two users started with action A (user 100 at timestamp 1000 and user 200 at timestamp 1000).
// -> B (2): Both of those users moved from action A to B as their first transition.
// -> C (1)
// -> A (1)
// For the user who went A → B → C (user 200), record B → C once.
// For the user who went A → B → A (user 100), record B → A once.
// B (2): Two users started with action B (user 300 at timestamp 1500 and 400 at timestamp 1700).
// -> B (1): Only one of those (user 300) had a second action (B → B).
// user 400 does not have any next action.

private struct Event {
    let userId: Int
    let time: Int
    let action: String
}

private let input: [Event] = [
    Event(userId: 100, time: 1000, action: "A"),
    Event(userId: 200, time: 1000, action: "A"),
    Event(userId: 100, time: 1100, action: "B"),
    Event(userId: 200, time: 1150, action: "B"),
    Event(userId: 200, time: 1200, action: "C"),
    Event(userId: 100, time: 1200, action: "A"),
    Event(userId: 300, time: 1500, action: "B"),
    Event(userId: 300, time: 1600, action: "B"),
    Event(userId: 400, time: 1700, action: "B"),
]

enum UserDrops {
  private func printTree(_ root: Node) {
    func sortedChildren(of node: Node) -> [Node] {
      node.children.values.sorted(by: { lhs, rhs in
        if lhs.count != rhs.count {
          return lhs.count > rhs.count
        } else {
          return lhs.action ?? "" < rhs.action ?? ""
        }
      })
    }
    
    func dfs(_ node: Node, depth: Int) {
      if depth == 0 {
        for first in sortedChildren(of: node) {
          print("\(first.action!) (\(first.count))")
          dfs(first, depth: 1)
        }
      } else {
        for child in sortedChildren(of: node) {
          let indent = String(repeating: "  ", count: depth - 1)
          print("\(indent)-> \(child.action!) (\(child.count))")
          dfs(child, depth: depth + 1)
        }
      }
    }
    
    dfs(root, depth: 0)
  }
  
  private func nodes(_ events: [Event]) -> Node {
    var users: [Int: [Event]] = events
      .reduce(into: [Int: [Event]]()) { $0[$1.userId, default: []].append($1) }
      
    for (user, events) in users {
      users[user]?.sort { $0.time < $1.time }
    }
    
    let root = Node()
    for (user, events) in users {
      let actions = events.map(\.action)
      guard !actions.isEmpty else { continue }
      var temp = root
      for action in actions {
        temp = temp.child(action)
        temp.count += 1
      }
    }
    
    return root
  }
  
  private final class Node {
    var action: String? = nil
    var count = 0
    var children: [String: Node] = [:]
    
    init(action: String? = nil) {
      self.action = action
    }
    
    func child(_ action: String) -> Node {
      if let child = children[action] {
        return child
      }
      
      let node = Node(action: action)
      children[action] = node
      return node
    }
  }
}
