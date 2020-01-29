/*
 Given a sorted linked list, delete all duplicates such that each element appear only once.
 
 Example 1:
 
 Input: 1->1->2
 Output: 1->2
 */

 public class ListNodeDuplicate {
     public var val: Int
     public var next: ListNodeDuplicate?
     public init(_ val: Int) {
         self.val = val
         self.next = nil
     }
 }
 
class SolutionDuplicateLinked {
    func deleteDuplicates(_ head: ListNodeDuplicate?) -> ListNodeDuplicate? {
        
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
