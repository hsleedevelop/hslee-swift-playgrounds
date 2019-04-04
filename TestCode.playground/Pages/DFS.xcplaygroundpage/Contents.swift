import Foundation
import XCPlayground

//:![sample](graph.png)

//깊이 우선
typealias GRAPH = [String: Set<String>]
class DFS {
    
    func dfs_recursive(_ graph: GRAPH, start: String, visited: [String]) -> [String] {
        var visited = visited
        if visited.contains(start) == false {
            visited.append(start)
            
            for node in graph[start]?.subtracting(visited) ?? [] {
                visited = dfs_recursive(graph, start: node, visited: visited)
            }
        }
        return visited
    }
    
    func dfs_iterator(_ graph: GRAPH, start: String) -> [String] {
        var visited = [String]()
        var stack = [start]
        
        while stack.count > 0 {
            let node = stack.popLast()!
            if visited.contains(node) == false {
                visited.append(node)
                stack.append(contentsOf: graph[node]?.subtracting(visited) ?? [])
            }
        }
        return visited
    }
    
    func dfs_paths(_ graph: GRAPH, start: String, goal: String) -> [[String]] {
        var stack = [(start, [start])]
        var result = [[String]]()
        
        while stack.count > 0 {
            let node = stack.popLast()!
            for next in graph[node.0]?.subtracting(node.1) ?? [] {
                if next == goal {
                    result.append(node.1 + [next])
                } else {
                    stack.append((next, node.1 + [next]))
                }
            }
        }
        return result
    }
}

let graph: GRAPH = ["A": Set(["B", "C"]),
                    "B": Set(["A", "D", "E"]),
                    "C": Set(["A", "F"]),
                    "D": Set(["B"]),
                    "E": Set(["B", "F"]),
                    "F": Set(["C", "E"])]

let visited = [String]()
let dfs = DFS().dfs_recursive(graph, start: "A", visited: visited)
let dfs2 = DFS().dfs_iterator(graph, start: "A")
let dfs3 = DFS().dfs_paths(graph, start: "A", goal: "F")
//print(dfs)
//print(dfs2)
print(dfs3)
//let sequence : Array<Int> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]


