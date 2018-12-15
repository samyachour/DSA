/*
-Binary tree is a tree where each node has 0, 1, or 2 children
    -root is the top of the tree, leaves have no children, left/right nodes
    -Binary search trees perform insertions/deletions such that the tree is always sortedß
*/

enum BinaryTree<T> {
    case empty
    indirect case node(BinaryTree, T, BinaryTree)
    
    var count: Int {
        switch self {
        case let .node(left, _, right):
            return left.count + 1 + right.count
        case .empty:
            return 0
        }
    }
}

extension BinaryTree: CustomStringConvertible {
    var description: String {
        switch self {
        case let .node(left, value, right):
            return "value: \(value), left = [" + left.description + "], right = [" + right.description + "]"
        case .empty:
            return ""
        }
    }
}

enum BinarySearchTreeEnum<T: Comparable> {
    case empty
    indirect case node(BinarySearchTreeEnum, T, BinarySearchTreeEnum)
    
    var count: Int {
        switch self {
        case let .node(left, _, right):
            return left.count + 1 + right.count
        case .empty:
            return 0
        }
    }
    
    mutating func naiveInsert(newValue: T) {
        guard case .node(var left, let value, var right) = self else {
            self = .node(.empty, newValue, .empty)
            return
        }
        
        if newValue < value {
            left.naiveInsert(newValue: newValue)
        } else {
            right.naiveInsert(newValue: newValue)
        }
        
    }
    
    private func newTreeWithInsertedValue(newValue: T) -> BinarySearchTreeEnum {
        switch self {
        case .empty:
            return .node(.empty, newValue, .empty)
        case let .node(left, value, right):
            if newValue < value {
                return .node(left.newTreeWithInsertedValue(newValue: newValue), value, right)
            } else {
                return .node(left, value, right.newTreeWithInsertedValue(newValue: newValue))
            }
        }
    }
    
    mutating func insert(newValue: T) {
        self = newTreeWithInsertedValue(newValue: newValue)
    }
    
    func traverseInOrder(process: (T) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            left.traverseInOrder(process: process)
            process(value)
            right.traverseInOrder(process: process)
        }
    }
    
    func traversePreOrder( process: (T) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            process(value)
            left.traversePreOrder(process: process)
            right.traversePreOrder(process: process)
        }
    }
    
    func traversePostOrder( process: (T) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            left.traversePostOrder(process: process)
            right.traversePostOrder(process: process)
            process(value)
        }
    }
    
    func search(searchValue: T) -> BinarySearchTreeEnum<T>? {
        switch self {
        case .empty:
            return nil
        case let .node(left, value, right):
            // 1
            if searchValue == value {
                return self
            }
            
            // 2
            if searchValue < value {
                return left.search(searchValue: searchValue)
            } else {
                return right.search(searchValue: searchValue)
            }
        }
    }
}

extension BinarySearchTreeEnum: CustomStringConvertible {
    var description: String {
        switch self {
        case let .node(left, value, right):
            return "value: \(value), left = [" + left.description + "], right = [" + right.description + "]"
        case .empty:
            return ""
        }
    }
}
