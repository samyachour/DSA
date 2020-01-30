/*
-Queue is a list where you can only insert new items at the back and remove items from the front. First items you enqueue are also the first items you dequeue. FIFO
    -Appending to arrays (enqueueing here) in Swift is a O(1) (constant time) operation because arrays always have some space at the end (e.g. [1,2,3,xxx,xxx,xxx])
        -when the extra spots are used up the array resizes which is a O(N) operation but it only happens occasionally (so still O(1) on avg)
    -dequeueing is always O(N) because you need to shift the rest of the elements over in memory
    -The second implementation keeps empty spots at the front to optimize dequeueing by keeping track of a 'head' value
*/

public struct Queue<T> {
    
    fileprivate var list = DoublyLinkedList<T>()
    
    public var isEmpty: Bool {
        return list.isEmpty
    }
    
    public mutating func enqueue(_ element: T) {
        list.append(value: element)
    }
    
    public mutating func dequeue() -> T? {
        
        guard !list.isEmpty, let element = list.first else { return nil }
        
        list.remove(node: element)
        
        return element.value
    }
    
    public mutating func peek() -> T? {
        
        return list.first?.value
    }
}

extension Queue: CustomStringConvertible {
    
    public var description: String {
        return list.description
    }
}

public struct OptimalQueue<T> {
    fileprivate var array = [T?]()
    fileprivate var head = 0
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public var count: Int {
        return array.count - head
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        guard head < array.count, let element = array[head] else { return nil }
        
        array[head] = nil
        head += 1
        
        // Trim it down if empty spots are > 25%
        let percentage = Double(head)/Double(array.count)
        if array.count > 50 && percentage > 0.25 {
            array.removeFirst(head)
            head = 0
        }
        
        return element
    }
    
    public var front: T? {
        if isEmpty {
            return nil
        } else {
            return array[head]
        }
    }
}
