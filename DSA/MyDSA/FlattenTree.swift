/*
 Given a binary tree, flatten it to a linked list in-place.
 
 For example, given the following tree:
 
    1
   / \
  2   5
 / \   \
3   4   6
 The flattened tree should look like:
 
 1
  \
   2
    \
     3
      \
       4
        \
         5
          \
           6
 */

 // Definition for a binary tree node.
 public class TreeNodeFlatten {
     public var val: Int
     public var left: TreeNodeFlatten?
     public var right: TreeNodeFlatten?
     public init(_ val: Int) {
         self.val = val
         self.left = nil
         self.right = nil
     }
 }
 
class SolutionFlattenTree {
    var prev : TreeNodeFlatten?
    
    func flatten(_ root: TreeNodeFlatten?) {
        if root == nil {
            return
        }
        
        self.flatten(root?.right)
        self.flatten(root?.left)
        
        root?.right = prev
        root?.left = nil
        prev = root
    }
}
