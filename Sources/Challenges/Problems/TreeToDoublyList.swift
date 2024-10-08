/*
 Convert a Binary Search Tree to a sorted Circular Doubly-Linked List in place.

 You can think of the left and right pointers as synonymous to the predecessor and successor pointers in a doubly-linked list. For a circular doubly linked list, the predecessor of the first element is the last element, and the successor of the last element is the first element.

 We want to do the transformation in place. After the transformation, the left pointer of the tree node should point to its predecessor, and the right pointer should point to its successor. You should return the pointer to the smallest element of the linked list.
 
 Input: root = [4,2,5,1,3]
 Output: [1,2,3,4,5]
 
 Input: root = [2,1,3]
 Output: [1,2,3]
 */

enum TreeToDoublyList {
  class Node {
    init(_ val: Int, _ left: Node? = nil, _ right: Node? = nil ) {
      self.val = val
      self.left = left
      self.right = right
    }
        
    var val: Int
    var left: Node?
    var right: Node?
        
    init(_ val: Int) {
      self.val = val
      self.left = nil
      self.right = nil
    }
        
    init(@NodeBuilder values: () -> Node) {
      let node = values()
      self.val = node.val
      self.right = node.right
    }
  }
    
  @resultBuilder
  struct NodeBuilder {
    static func buildBlock(_ components: Int...) -> Node {
      var head: Node? = nil
      var tail: Node? = nil
            
      for value in components {
        let node = Node(value)
                
        if head == nil {
          head = node
          tail = node
        } else {
          tail?.right = node
          tail = node
        }
      }
            
      return head!
    }
  }
    
  private nonisolated(unsafe) static var head: Node? = nil
  private nonisolated(unsafe) static var tail: Node? = nil
    
  static func treeToDoublyList(_ root: Node?) -> Node? {
    traverse(root)
        
    head?.left = tail
    tail?.right = head
        
    return head
  }
    
  static func traverse(_ node: Node?) {
    guard let node else { return }
        
    traverse(node.left)
    if head == nil {
      head = node
    } else {
      node.left = tail
      tail?.right = node
    }
    tail = node
    traverse(node.right)
  }
}
