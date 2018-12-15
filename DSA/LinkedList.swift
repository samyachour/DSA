/*
-Linked list is a sequence of data items where each item is a 'node' pointing to the next one
    -Singly linked lists are where each node only has a reference to the next node
        -Search/Access O(n), Insertion/Deletion(1)
    -Doubly linked lists are when each node has a reference to the previous and next node
        -Search/Access O(n), Insertion/Deletion(1)
    -First and last nodes are the head and tail, kept track of w/ pointers
    -Removal
        -Removing the first node just requires the head & previous pointers to be updated
        -Removing the last node just requires the next & tail pointers to be updated
        -Removing a node in the middle requires the previous & next pointers to be updated
*/


public class Node<T> {
    
    var value: T
    var next: Node<T>?
    // To prevent retain cycle
    weak var previous: Node<T>?
    
    init(value: T) {
        self.value = value
    }
}


public class DoublyLinkedList<T> {
    
    fileprivate var head: Node<T>?
    private var tail: Node<T>?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node<T>? {
        return head
    }
    
    public var last: Node<T>? {
        return tail
    }
    
    public func append(value: T) {
        let newNode = Node(value: value)
        
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        } else {
            head = newNode
        }
        
        tail = newNode

    }
    
    public func nodeAt(index: Int) -> Node<T>? {
        
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
    
    public func remove(node: Node<T>) -> T {
        
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.previous = prev
        
        if next == nil {
            tail = prev
        }
        
        node.previous = nil
        node.next = nil
        
        return node.value
    }
    
    public func insert(_ node: Node<T>, atIndex index: Int) {
        let newNode = node
        if index == 0 {
            newNode.next = head
            head?.previous = newNode
            head = newNode
        } else {
            let prev = self.nodeAt(index: index-1)
            let next = prev?.next
            
            newNode.previous = prev
            newNode.next = prev?.next
            prev?.next = newNode
            next?.previous = newNode
        }
    }
    
    public func reverse() {
        var node = head
        tail = node // If you had a tail pointer
        while let currentNode = node {
            node = currentNode.next
            swap(&currentNode.next, &currentNode.previous)
            head = currentNode
        }
    }
}

extension DoublyLinkedList: CustomStringConvertible {

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

public class SinglyNode<T: Comparable> {
    
    var value: T
    var next: SinglyNode<T>?
    
    init(value: T) {
        self.value = value
    }
}

extension SinglyNode: Equatable {
    public static func == (lhs: SinglyNode<T>, rhs: SinglyNode<T>) -> Bool {
        return lhs.value == rhs.value
            && lhs.next == rhs.next
    }
}

public class SinglyLinkedList<T: Comparable> {
    
    fileprivate var head: SinglyNode<T>?
    private var tail: SinglyNode<T>?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: SinglyNode<T>? {
        return head
    }
    
    public var last: SinglyNode<T>? {
        return tail
    }
    
    public func append(value: T) {
        let newNode = SinglyNode(value: value)
        
        if let tailNode = tail {
            tailNode.next = newNode
        } else {
            head = newNode
        }
        
        tail = newNode
    }
    
    public func nodeAt(index: Int) -> SinglyNode<T>? {
        
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
    
    public func remove(node: SinglyNode<T>) -> T {
        
        let next = node.next
        let prev = getPrevious(nodeGiven: node)
        
        if let next = next {
            
            if node.value == head?.value {
                
                head = next
                
            } else if let previous = prev {
                
                previous.next = next
                
            }
            
            node.next = nil
            
        } else if let previous = prev {
            
            tail = previous
            previous.next = nil
            
        }
        
        return node.value
    }
    
    private func getPrevious(nodeGiven: SinglyNode<T>) -> SinglyNode<T>? {
        
        var node = head
        
        while node != nil {
        
            if let next = node!.next {
                if next.value == nodeGiven.value { return node }
            }
            
            node = node!.next
        
        }
        
        return nil
        
        
    }
    
    public func insert(_ node: SinglyNode<T>, atIndex index: Int) {
        let newNode = node
        if index == 0 {
            newNode.next = head
            head = newNode
        } else {
            let prev = self.nodeAt(index: index-1)
            
            newNode.next = prev?.next
            prev?.next = newNode
        }
    }
}

extension SinglyLinkedList: CustomStringConvertible {
    
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
