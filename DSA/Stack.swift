/*
-Stacks is a LIFO data structure where you can push or pop only from the top (as well as peek)
    -Insertion/Deletion O(1), Access/Search O(n)
 */

struct Stack<Element> {
    
    fileprivate var array : [Element]
    
    var count : Int {
        return array.count
    }
    
    var isEmpty : Bool {
        return array.isEmpty
    }
    
    init (array : [Element]) {
        self.array = array
    }
    
    // Mutating to make value type property editable
    mutating func pop() -> Element? {
        return array.popLast()
    }
    
    func peek() -> Element? {
        return array.last
    }
    
    mutating func push(new : Element) {
        array.append(new)
    }
}

extension Stack : CustomStringConvertible {
    
    var description: String {
        let topDivider = "---Stack---\n"
        let bottomDivider = "\n-----------\n"
        
        let stackElements = array.map {"\($0)"}.reversed().joined(separator: "\n")

        return topDivider + stackElements + bottomDivider
    }
    
}

