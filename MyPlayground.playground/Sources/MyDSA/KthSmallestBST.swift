/*
Given a binary search tree, write a function kthSmallest to find the kth smallest element in it.

Note:
You may assume k is always valid, 1 ≤ k ≤ BST's total elements.

    3
   /
  2
 /
1

Input: root = [5,3,6,2,4,null,null,1], k = 3
      5
     / \
    3   6
   / \
  2   4
 /
1
Output: 3

init node list (w/ max length k)

loop:

	if node.left exists & not in list, insert val at front of list (pop last off if max length hit)

	if node.left doesn't exist, if node.right exists & not in list, insert after current node val index

	if neither exist, go to to parent node

return last element in list

*/


public class TreeNodeKth {
	    public var val: Int
	    public var left: TreeNodeKth?
	    public var right: TreeNodeKth?
	    public init(_ val: Int) {
		        self.val = val
			        self.left = nil
			        self.right = nil
		    }
	}

class SolutionKthSmallest {
    
    var res = 0
    var maxLength = 0
    
    func kthSmallest(_ root: TreeNodeKth?, _ k: Int) -> Int {
        
        maxLength = k
        helper(node: root)
        return res
    }
    
    func helper(node: TreeNodeKth?) {
        guard let node = node else {
            return
        }
        
        helper(node: node.left)
        maxLength -= 1
        if maxLength == 0 {
            res = node.val
            return
        }
        helper(node: node.right)
        
    }
    
    func insertSorted(val: Int, arr: inout [Int]) {
        
        for (idx,elem) in arr.enumerated() {
            
            if val > elem && val <= arr[idx + 1] {
                arr.insert(val, at: idx)
                return
            }
            
        }
        
    }
	
	func kthSmallestBAD(_ root: TreeNodeKth?, _ k: Int) -> Int {
		
        guard var node = root else {
            return 0
        }
        
		var end = false
		var lastNode = node
        var lastNodes = [node.val]
		
		while !end || lastNodes.count <= k {
            
			if let left = node.left, !lastNodes.contains(left.val) {
                insertSorted(val: left.val, arr: &lastNodes)
				lastNode = node
				node = left
                continue
            } else if node.left == nil {
                end = true
            }
            if let right = node.right, !lastNodes.contains(right.val) {
                insertSorted(val: right.val, arr: &lastNodes)
                lastNode = node
                node = right
                continue
            }
            node = lastNode
        }
		
        if lastNodes.count == 0 {
            return 0
        } else if k - 1 < lastNodes.count {
            return lastNodes[k-1]
        } else {
            return lastNodes.last!
        }
		
	}
}
