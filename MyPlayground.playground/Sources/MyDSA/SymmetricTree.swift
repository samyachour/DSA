/*
Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).
*/


public class TreeNodeSymmetric {
    public var val: Int
    public var left: TreeNodeSymmetric?
    public var right: TreeNodeSymmetric?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class SolutionSymmetric {
	
	func traverse(left: TreeNodeSymmetric?, right: TreeNodeSymmetric?) -> Bool {
		if left == nil && right == nil {
			return true
		}
		
		guard let left = left, let right = right else {
			return false
		}
		
		return left.val == right.val && traverse(left: left.left, right: right.right) && traverse(left: left.right, right: right.left)
	}
	
	func isSymmetric(_ root: TreeNodeSymmetric?) -> Bool {
		
		guard let root = root else {
			return true
		}
		return traverse(left: root.left, right: root.right)
		
	}
}
