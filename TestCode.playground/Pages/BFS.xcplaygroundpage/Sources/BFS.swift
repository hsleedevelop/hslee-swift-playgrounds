import Foundation

//너비 우선
public typealias GRAPH = [String: Set<String>]
open class BFS {
    public init() {}
    
    public func bfs_recursive(_ graph: GRAPH, start: String, visited: [String], queue: [String]) -> [String] {
        var visited = visited
        var queue = queue
        
        if visited.contains(start) == false {
            visited.append(start)
            //queue.append(contentsOf: graph[start]?.subtracting(visited) ?? [])
            for node in graph[start]?.subtracting(visited) ?? [] {
                queue.append(node)
            }
        }
        
        if queue.count > 0 {
            let node = queue.removeFirst()
            visited = bfs_recursive(graph, start: node, visited: visited, queue: queue)
        }
        return visited
    }
    
    public func bfs_iterator(_ graph: GRAPH, start: String) -> [String] {
        var visited = [String]()
        var queue = [start]
        
        while queue.count > 0 {
            let node = queue.removeFirst()
            if visited.contains(node) == false {
                visited.append(node)
                //print(visited)
                //queue.append(contentsOf: graph[node]?.subtracting(visited) ?? [])
                for next in graph[node]?.subtracting(visited) ?? [] {
                    queue.append(next)
                }
            }
        }
        return visited
    }
    
    public func bfs_paths(_ graph: GRAPH, start: String, goal: String) -> [[String]] {
        var queue = [(start, [start])]
        var result = [[String]]()

        while queue.count > 0 {
            let node = queue.removeFirst()
            for next in graph[node.0]?.subtracting(node.1) ?? [] {
                if next == goal {
                    result.append(node.1 + [next])
                } else {
                    queue.append((next, node.1 + [next]))
                }
            }
        }
        return result
    }
}
