/*
 Singly and doubly, pointing to next (+ prev*) nodes
 */

class singlyNodeImp {
    
    var val : Int
    var next : singlyNodeImp?
    
    init(val: Int) {
        self.val = val
    }
    
}

class singlyLinkedListImp {
    
    var head : singlyNodeImp?
    var tail : singlyNodeImp?
    
    init(node: singlyNodeImp) {
        self.head = node
    }
    
    func find(val: Int) -> Int? {
        if head == nil {
            return nil
        }
        var node = head
        var idx = 0
        while let nodeNext = node {
            
            if nodeNext.val == val { return idx }
            node = nodeNext.next
            idx += 1
            
        }
        
        return nil
        
    }
    
}
