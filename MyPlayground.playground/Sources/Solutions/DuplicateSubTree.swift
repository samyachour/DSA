/*
 Given a binary tree, return all duplicate subtrees. For each kind of duplicate subtrees, you only need to return the root node of any one of them.
 
 Two trees are duplicate if they have the same structure with same node values.
 */

class SolutionDuplicateSubTree {
    var ans = [TreeNode]()
    var subTrees = [String : Int]()
    
    func collect(node_: TreeNode?) -> String {
        guard let node = node_ else { return "#" }
        
        let serial = "\(node.val),\(collect(node_: node.left)),\(collect(node_: node.right))"
        
        if let count = subTrees[serial] {
            subTrees[serial] = count + 1
            if count + 1 == 2 {
                ans.append(node)
            }
        } else {
            subTrees[serial] = 1
        }
        return serial
        
    }
    
    
    func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
        collect(node_: root)
        return ans
    }
}
