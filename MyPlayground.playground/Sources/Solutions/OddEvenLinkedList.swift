/*
 Given a singly linked list, group all odd nodes together followed by the even nodes. Please note here we are talking about the node number and not the value in the nodes.
 
 You should try to do it in place. The program should run in O(1) space complexity and O(nodes) time complexity.
 
 Example 1:
 
 Input: 1->2->3->4->5->NULL
 Output: 1->3->5->2->4->NULL
 Example 2:
 
 Input: 2->1->3->5->6->4->7->NULL
 Output: 2->3->6->7->1->5->4->NULL
 Note:
 
 The relative order inside both the even and odd groups should remain as it was in the input.
 The first node is considered odd, the second node even and so on ...
 */

/**
 * Definition for singly-linked list.
 */
 
/*
 1->2->3->4->5->NULL
 1->3->2->4->5->NULL
 1->3->2->5->4->NULL
 */
class SolutionOddEvenLinked {
    
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        
        var odds = ListNode(0)
        var evens = ListNode(0)
        let oddsHead = odds
        let evensHead = evens
        var head_ = head
        
        var isOdd = true
        
        while head_ != nil {
            if isOdd {
                odds.next = head_!
                odds = odds.next!
            } else {
                evens.next = head_!
                evens = evens.next!
            }
            isOdd = !isOdd
            head_ = head_!.next
        }
        evens.next = nil
        odds.next = evensHead.next
        return oddsHead.next
    }
}
