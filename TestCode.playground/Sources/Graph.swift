import Foundation

public struct Vertex<T: Hashable> {
    var data: T
}

extension Vertex: Hashable {
    public var hashValue: Int {
        return "\(data)".hashValue
    }
    
    static public func ==(lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.data == rhs.data
    }
}

extension Vertex: CustomStringConvertible {
    public var description: String {
        return "\(data)"
    }
}


public enum EdgeType {
    case directed, undirected
}

public struct Edge<T: Hashable> {
    public var source: Vertex<T>
    public var destination: Vertex<T>
    public let weight: Double?
}

extension Edge: Hashable {
    public var hashValue: Int {
        return "\(source)\(destination)\(weight!)".hashValue
    }
    
    static public func == (lhs: Edge<T>, rhs: Edge<T>) -> Bool {
        return lhs.source == rhs.source &&
            lhs.destination == rhs.destination &&
            lhs.weight == rhs.weight
    }
}

protocol Graphable {
    associatedtype Element: Hashable
    var description: CustomStringConvertible { get }
    
    func createVertex(data: Element) -> Vertex<Element>
    func add(_ type: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double?
    func edges(from source: Vertex<Element>) -> [Edge<Element>]?
}

open class AdjacencyList<T: Hashable> {
    public var adjacencyDic: [Vertex<T>: [Edge<T>]] = [:]
    public init() {}
    
    func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(data: data)
        
        if adjacencyDic[vertex] == nil {
            adjacencyDic[vertex] = []
        }
        return vertex
    }
}
