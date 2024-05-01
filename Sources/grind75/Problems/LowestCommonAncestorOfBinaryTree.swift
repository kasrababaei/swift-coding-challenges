/*
 Given two nodes of a binary tree p and q, return their lowest common ancestor (LCA).
 
 Each node will have a reference to its parent node. The definition for Node is below:
 
 class Node {
 public int val;
 public Node left;
 public Node right;
 public Node parent;
 }
 According to the definition of LCA on Wikipedia: "The lowest common ancestor of two nodes p and q in a tree T is the lowest node that has both p and q as descendants (where we allow a node to be a descendant of itself)."
 
 
 
 Example 1:
 
 
 Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
 Output: 3
 Explanation: The LCA of nodes 5 and 1 is 3.
 Example 2:
 
 
 Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
 Output: 5
 Explanation: The LCA of nodes 5 and 4 is 5 since a node can be a descendant of itself according to the LCA definition.
 Example 3:
 
 Input: root = [1,2], p = 1, q = 2
 Output: 1
 
 */

class LowestCommonAncestorOfBinaryTree {
    class Node {
        var val: Int
        var left: Node?
        var right: Node?
        var parent: Node?
        
        init(_ val: Int) {
            self.val = val
            self.left = nil
            self.right = nil
            self.parent = nil
        }
    }
    
    class Solution {
        func lowestCommonAncestor(_ p: Node?,_ q: Node?) -> Node? {
            let pPath = rootPath(p!)
            let qPath = rootPath(q!)
            
            var index = 0
            
            for (i, pair) in zip(pPath, qPath).enumerated() {
                guard pair.0.val == pair.1.val else { break }
                index = i
            }
            
            return pPath[index]
        }
        
        func rootPath(_ node: Node) -> [Node] {
            var path: [Node] = [node]
            var currentNode: Node? = node
            
            while currentNode != nil {
                if let parent = currentNode?.parent {
                    path.append(parent)
                }
                
                currentNode = currentNode?.parent
            }
            
            return Array(path.reversed())
        }
    }
}
