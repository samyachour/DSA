import Foundation

/*
 A binary tree is univalued if every node in the tree has the same value.

 Return true if and only if the given tree is univalued.
 */

class SolutionUnivalTree {
    func isUnivalTree(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }

        return root.val == (root.left?.val ?? root.val) &&
               root.val == (root.right?.val ?? root.val) &&
               isUnivalTree(root.left) &&
               isUnivalTree(root.right)
    }
}
