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
	
	var lastNodes = [Int]()
	var maxLength = 0
	var lastNodesPrimed : [Int] {
		if lastNodes.count > maxLength {
			return Array( lastNodes[0..<(maxLength - 1)] )
		}
		return lastNodes
	}
	
	func kthSmallest(_ root: TreeNodeKth?, _ k: Int) -> Int {
		
		maxLength = k
		var end = false
		var node = root
		var lastNode = node
		
		while !end && lastNodes.count < k {
			
			if let left = node?.left, !lastNodes.contains(left.val) {
				
				lastNode = node
				node = left
			} else {
				end = true
			}
			
			print('blad')
		}
		
		
		return lastNodesPrimed[k-1]
	}
}
