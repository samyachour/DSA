/*
-Tree is a collection of root, nodes, and leaves
    -each subsequent section of the heirarchy is a new level
    -root is the entry point, 0th level node
    -node is a block of data
    -leaf is a node w/ no children
*/

class Node<T> {
    var value : T
    var children : [Node] = []
    weak var parent : Node?
    
    init(value: T) {
        self.value = value
    }
    
    func add(child: Node) {
        children.append(child)
        child.parent = self
    }
}

extension Node where T: Equatable {
    func search(value: T) -> Node? {
        if value == self.value {
            return self
        }
        for child in children {
            if let found = child.search(value: value) {
                return found
            }
        }
        return nil
    }
}

extension Node: CustomStringConvertible {

    var description: String {
        var text = "\(value)"
        
        if !children.isEmpty {
            text += " {" + children.map { $0.description }.joined(separator: ", ") + "} "
        }
        return text
    }
}
