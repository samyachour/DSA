/*
 Given two binary trees, write a function to check if they are the same or not.
 
 Two binary trees are considered the same if they are structurally identical and the nodes have the same value.
 
 Example 1:
 
 Input:     1         1
 / \       / \
 2   3     2   3
 
 [1,2,3],   [1,2,3]
 
 Output: true
 */

private extension TreeNode {
    func traversePostOrder(process: (Int?) -> Void) {
        left?.traversePostOrder(process: process) ?? process(nil)
        right?.traversePostOrder(process: process) ?? process(nil)

        process(val)
    }
}

class SolutionSameTree {
    
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        var pValues = [Int?]()
        p?.traversePostOrder(process: { (val) in
            pValues.append(val)
        })
        var qValues = [Int?]()
        q?.traversePostOrder(process: { (val) in
            qValues.append(val)
        })
        
        return pValues == qValues
    }
}
