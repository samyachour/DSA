/*
 Given a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list.
 */

func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    
    var node = head
    let temp = ListNode(0)
    temp.next = node
    var last = temp
    
    while let node = last.next, let nextNode = node.next {
        
        if node.val == nextNode.val {
            node.next = nextNode.next
            if node.val != node.next?.val {
                last.next = node.next
            }
        }
        else {
            last = node
        }
        
    }
    
    return temp.next
}
