/*
 Given a sorted linked list, delete all duplicates such that each element appear only once.
 
 Example 1:
 
 Input: 1->1->2
 Output: 1->2
 */
 
class SolutionDuplicateLinked {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        
        var currNode = head
        
        while currNode != nil {
            
            if currNode!.val == currNode!.next?.val {
                currNode!.next = currNode!.next?.next
            } else {
                currNode = currNode!.next
            }
            
        }
        
        return head
        
    }
}
