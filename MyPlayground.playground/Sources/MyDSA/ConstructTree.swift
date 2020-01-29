/*
 Given preorder and inorder traversal of a tree, construct the binary tree. Assume duplicates do not exist
 
 preorder = [3,9,1,4,20,15,7]
 inorder = [1,9,4,3,15,20,7]
 Return the following binary tree:
 
         3
        / \
      9    20
    /  \  /  \
   1   4 15   7
 
 
split inorder array in half
    get mid point of left
    get mid point of right
 
 
create rood node preorder[0] // 3
    if preorder.count == 1 && inorder.count == 1 {
        return Node(preorder[0])
    }
 
    leftChild = preoder[1] // 9
    midPoint = inorder.find(3)
    delta = midpoint - inorder.find(leftChild) // 2
    rightChild = inorder[midpoint + delta]
 
    root.left = build(inorder[0...midpoint], preorder[1...preorder.find(rightChild)])
    root.right = build(inorder[midpoint...], preorder[preorder.find(rightChild)...])
 
return root node
 
 */

 public class TreeNodeConstruct {
     public var val: Int
     public var left: TreeNodeConstruct?
     public var right: TreeNodeConstruct?
     public init(_ val: Int) {
         self.val = val
         self.left = nil
         self.right = nil
     }
 }
 
class SolutionConstruct {
    
    var preorder_ = [Int]()
    
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNodeConstruct? {
        preorder_ = preorder
        if preorder == [] || inorder == [] {
            return nil
        }
        
        let root = TreeNodeConstruct( preorder_.remove(at: 0) )
        let inorderIndex = inorder.firstIndex(of: root.val)!
        
        root.left = buildTree(preorder_, Array(inorder[0..<inorderIndex]))
        root.right = buildTree(preorder_, Array(inorder[(inorderIndex + 1)...]))
        
        return root
    }
    
    func buildTreeBad(_ preorder: [Int], _ inorder: [Int]) -> TreeNodeConstruct? {
        if preorder == [] && inorder == [] {
            return nil
        }
        if inorder.count == 1 {
            return TreeNodeConstruct(inorder[0])
        }
        if preorder.count == 2 {
            let root = TreeNodeConstruct(preorder[0])
            if preorder[1] == inorder[0] {
                root.left = TreeNodeConstruct(preorder[1])
            } else {
                root.right = TreeNodeConstruct(preorder[1])
            }
            return root
        }
        
        let midPoint = inorder.firstIndex(of: preorder[0])!
        let root = TreeNodeConstruct(inorder[midPoint])
        
        if midPoint == inorder.count - 1 {
            let leftInOrder = Array( inorder[0..<midPoint] )
            let leftPreOrder = Array ( preorder[1...] )
            root.left = buildTreeBad(leftPreOrder, leftInOrder)
        } else if midPoint == 0 {
            let rightInOrder = Array( inorder[(midPoint + 1)...] )
            let rightPreOrder = Array ( preorder[1...] )
            root.right = buildTreeBad(rightPreOrder, rightInOrder)
        } else {
            
            let leftInOrder = Array( inorder[0..<midPoint] )
            let rightInOrder = Array( inorder[(midPoint + 1)...] )
            let rightIdx = preorder.firstIndex(of: rightInOrder[rightInOrder.count/2])!
            let leftPreOrder = Array ( preorder[1..<rightIdx] )
            let rightPreOrder = Array ( preorder[(rightIdx...)] )
            
            
            root.left = buildTreeBad(leftPreOrder, leftInOrder)
            root.right = buildTreeBad(rightPreOrder, rightInOrder)
            
        }
        return root
    }

}
