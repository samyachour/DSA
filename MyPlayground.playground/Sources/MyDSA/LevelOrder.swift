/*
 
 */

func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
    guard let rootNode = root else { return [] }
    var resultNodes = [[rootNode]]
    var result = [[rootNode.val]]
    var tempNodes = [TreeNode]()
    var temp = [Int]()
    var last = 0
    
    while last < result.count {
        
        for node in resultNodes[last] {
            
            if let left = node.left {
                tempNodes.append(left)
                temp.append(left.val)
            }
            if let right = node.right {
                tempNodes.append(right)
                temp.append(right.val)
            }
        }
        
        if !temp.isEmpty {
            resultNodes.append(tempNodes)
            result.append(temp)
        }
        tempNodes = []
        temp = []
        last += 1
    }
    
    return result.reversed()
}
