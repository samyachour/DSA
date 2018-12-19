/*
 Given a binary tree, determine if it is height-balanced.
 
 For this problem, a height-balanced binary tree is defined as:
 
 a binary tree in which the depth of the two subtrees of every node never differ by more than 1.
 */

public class TreeNodeBalanced {
        public var val: Int
        public var left: TreeNodeBalanced?
        public var right: TreeNodeBalanced?
        public init(_ val: Int) {
                self.val = val
                    self.left = nil
                    self.right = nil
            }
    }

class SolutionBalanced {
    func isBalanced(_ root: TreeNodeBalanced?) -> Bool {
        guard let root = root else {
            return true
        }
        
        return abs(getHeight(node: root.left) - getHeight(node: root.right)) < 2 && isBalanced(root.left) && isBalanced(root.right)
    }
    
    func getHeight(node: TreeNodeBalanced?) -> Int {
        
        guard let node = node else {
            return 0
        }
        
        return 1 + max(getHeight(node: node.left), getHeight(node: node.right))
        
    }
}
