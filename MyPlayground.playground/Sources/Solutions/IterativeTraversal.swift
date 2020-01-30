/*
 Given a binary tree, return the inorder traversal of its nodes' values.
 */

class SolutionTraverse {
    
    var vals = [Int]()
    
    func iterativeTraversal(node_: TreeNode?) {
        
        var node = node_
        
        while let left = node?.left {
            node = left
        }
        
        
    }
    
    func recursiveTraversal(node: TreeNode?) {
        guard let node = node else {
            return
        }
        recursiveTraversal(node: node.left)
        vals.append(node.val)
        recursiveTraversal(node: node.right)
    }
    
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        iterativeTraversal(node_: root)
        return vals
    }
}
