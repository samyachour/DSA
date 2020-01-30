/*
 Given a binary tree, find its maximum depth.
 
 The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
 
 Note: A leaf is a node with no children.
 
 Example:
 
 Given binary tree [3,9,20,null,null,15,7],
 
    3
   / \
  9  20
    / \
   15  7
 return its depth = 3.
 
 - Go down a path, when we hit a leaf record the depth (if max), go up a level, and try the other leaf, if that leaf doesn't work, go up a level, try the other one.
 */

class SolutionMaxDepth {
    
    func maxDepth(_ root: TreeNode?) -> Int {
        
        if let root = root {
            let leftHeight = maxDepth(root.left)
            let rightHeight = maxDepth(root.right)
            return max(leftHeight, rightHeight) + 1
        } else {
            return 0
        }
        
    }
}
