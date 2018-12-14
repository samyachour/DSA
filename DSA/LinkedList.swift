/*
-Linked list is a sequence of data items where each item is a 'node' pointing to the next one
    -Singly linked lists are where each node only has a reference to the next node
        -Search/Access O(n), Insertion/Deletion(1)
    -Doubly linked lists are when each node has a reference to the previous and next node
        -Search/Access O(n), Insertion/Deletion(1)
    -First and last nodes are the head and tail, kept track of w/ pointers
*/


public class Node {
    
    var value: String
    var next: Node?
    // To prevent retain cycle
    weak var previous: Node?
    
    init(value: String) {
        self.value = value
    }
}

public class LinkedList {
    
    fileprivate var head: Node?
    private var tail: Node?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node? {
        return head
    }
    
    public var last: Node? {
        return tail
    }
    
    public func append(value: String) {
        let newNode = Node(value: value)
        
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        }
        
        else {
            head = newNode
        }
        
        tail = newNode
    }
    
    public func nodeAt(index: Int) -> Node? {
        
        if index >= 0 {
            var node = head
            var i = index
            
            while node != nil {
                if i == 0 { return node }
                i -= 1
                node = node!.next
            }
        }
        
        return nil
    }
    
    public func removeAll() {
        head = nil
        tail = nil
    }
}

extension LinkedList: CustomStringConvertible {

    public var description: String {

        var text = "["
        var node = head

        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil { text += ", " }
        }

        return text + "]"
    }
}
