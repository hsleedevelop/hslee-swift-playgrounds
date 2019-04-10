import Foundation

public class Node<T> {
    var value: T
    var children: [Node] = []
    weak var parent: Node?
    
    public init (_ value: T) {
        self.value = value
    }
    
    public func add(child: Node) {
        children.append(child)
        child.parent = self
    }
}

// 1
extension Node: CustomStringConvertible {
    // 2
    public var description: String {
        // 3
        var text = "\(value)"
        
        // 4
        if !children.isEmpty {
            text += " {" + children.map { $0.description }.joined(separator: ", ") + "} "
        }
        return text
    }
}
