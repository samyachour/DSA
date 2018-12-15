/*
-vertices connected to other vertices by edges
    -weighted graphs apply weights to the edges
    -directed graphs apply directions to the edges
-can represent graphs as an adjacency matrix or adjancency list
*/

//public struct Vertex<T: Hashable> {
//    var data: T
//}
//
//// Each vertex is a key in the dictionary
//extension Vertex: Hashable {
//    public var hashValue: Int { // 1
//        return "\(data)".hashValue
//    }
//    
//    static public func ==(lhs: Vertex, rhs: Vertex) -> Bool { // 2
//        return lhs.data == rhs.data
//    }
//}
//
//extension Vertex: CustomStringConvertible {
//    public var description: String {
//        return "\(data)"
//    }
//}
//
//public enum EdgeType {
//    case directed, undirected
//}
//
//public struct Edge<T: Hashable> {
//    public var source: Vertex<T> // 1
//    public var destination: Vertex<T>
//    public let weight: Double? // 2
//}
//
//extension Edge: Hashable {
//    
//    public var hashValue: Int {
//        return "\(source)\(destination)\(weight)".hashValue
//    }
//    
//    static public func ==(lhs: Edge<T>, rhs: Edge<T>) -> Bool {
//        return lhs.source == rhs.source &&
//            lhs.destination == rhs.destination &&
//            lhs.weight == rhs.weight
//    }
//}
