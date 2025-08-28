/*
 
 Design a data structure that follows the constraints of a Least Recently Used (LRU) cache.

 Implement the LRUCache class:

 LRUCache(int capacity) Initialize the LRU cache with positive size capacity.
 int get(int key) Return the value of the key if the key exists, otherwise return -1.
 void put(int key, int value) Update the value of the key if the key exists. Otherwise, add the key-value pair to the cache. If the number of keys exceeds the capacity from this operation, evict the least recently used key.
 The functions get and put must each run in O(1) average time complexity.

  

 Example 1:

 Input
 ["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
 [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
 Output
 [null, null, null, 1, null, -1, null, -1, 3, 4]

 Explanation
 LRUCache lRUCache = new LRUCache(2);
 lRUCache.put(1, 1); // cache is {1=1}
 lRUCache.put(2, 2); // cache is {1=1, 2=2}
 lRUCache.get(1);    // return 1
 lRUCache.put(3, 3); // LRU key was 2, evicts key 2, cache is {1=1, 3=3}
 lRUCache.get(2);    // returns -1 (not found)
 lRUCache.put(4, 4); // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
 lRUCache.get(1);    // return -1 (not found)
 lRUCache.get(3);    // return 3
 lRUCache.get(4);    // return 4
  

 Constraints:

 1 <= capacity <= 3000
 0 <= key <= 104
 0 <= value <= 105
 At most 2 * 105 calls will be made to get and put.
 
 */

class LRUCache {
  var cache: [Int: Node] = [:]
  let capacity: Int
  var head: Node?
  var tail: Node?
    
  init(_ capacity: Int) {
    self.capacity = capacity
    self.head = Node(0, 0)
    self.tail = Node(0, 0)
    head?.next = tail
    tail?.prev = head
  }
    
  func get(_ key: Int) -> Int {
    if let node = cache[key] {
      moveToHead(node)
      return node.val
    }
    return -1
  }
    
  func put(_ key: Int, _ value: Int) {
    if let node = cache[key] {
      node.val = value
      moveToHead(node)
    } else {
      let node = Node(key, value)
      cache[key] = node
      addNode(node)
            
      if cache.count > capacity {
        if let tail = popTail() {
          cache.removeValue(forKey: tail.key)
        }
      }
    }
  }
    
  func moveToHead(_ node: Node) {
    removeNode(node)
    addNode(node)
  }
    
  func removeNode(_ node: Node) {
    let prev = node.prev
    let next = node.next
        
    prev?.next = next
    next?.prev = prev
  }
    
  func addNode(_ node: Node) {
    node.next = head?.next
    node.prev = head
        
    head?.next?.prev = node
    head?.next = node
  }
    
  func popTail() -> Node? {
    if let _tail = tail?.prev {
      removeNode(_tail)
      return _tail
    }
        
    return nil
  }
}

final class Node {
  var key: Int
  var val: Int
  var prev: Node?
  var next: Node?
    
  init(_ key: Int, _ val: Int) {
    self.key = key
    self.val = val
  }
}
