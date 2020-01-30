/*
Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).
*/

class SolutionSymmetric {
	
	func traverse(left: TreeNode?, right: TreeNode?) -> Bool {
		if left == nil && right == nil {
			return true
		}
		
		guard let left = left, let right = right else {
			return false
		}
		
		return left.val == right.val && traverse(left: left.left, right: right.right) && traverse(left: left.right, right: right.left)
	}
	
	func isSymmetric(_ root: TreeNode?) -> Bool {
		
		guard let root = root else {
			return true
		}
		return traverse(left: root.left, right: root.right)
		
	}
}
