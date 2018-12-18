/*
 Given a binary tree, return the inorder traversal of its nodes' values.
 */

 public class TreeNodeTraverse {
     public var val: Int
     public var left: TreeNodeTraverse?
     public var right: TreeNodeTraverse?
     public init(_ val: Int) {
         self.val = val
         self.left = nil
         self.right = nil
     }
 }

 class SolutionTraverse {
    
    var vals = [Int]()
    
    func iterativeTraversal(node_: TreeNodeTraverse?) {
        
        var node = node_
        
        while let left = node?.left {
            node = left
        }
        
        
    }
    
    func recursiveTraversal(node: TreeNodeTraverse?) {
        guard let node = node else {
            return
        }
        recursiveTraversal(node: node.left)
        vals.append(node.val)
        recursiveTraversal(node: node.right)
    }
    
    func inorderTraversal(_ root: TreeNodeTraverse?) -> [Int] {
        iterativeTraversal(node_: root)
        return vals
    }
}
