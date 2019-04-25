import Foundation
import XCPlayground

//:![sample](graph.png)

//깊이 우선
typealias GRAPH = [String: Set<String>]
typealias GRAPH2 = [Int: Set<Int>]


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
                
                let subs = graph[node]?.subtracting(visited) ?? []
                print("\(node), \(visited), \(stack), subs=\(subs)")
                stack.append(contentsOf: subs)
                print("\(node), \(visited), \(stack)")
            }
        }
        return visited
    }
    
    func dfs_paths(_ graph: GRAPH, start: String, goal: String) -> [[String]] {
        var stack = [(start, [start])]
        var result = [[String]]()
        
        while stack.count > 0 {
            print("\(stack), \(result)")
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

var graph: GRAPH = ["A": Set(["B", "C"]),
                    "B": Set(["A", "D", "E"]),
                    "C": Set(["A", "F"]),
                    "D": Set(["B"]),
                    "E": Set(["B", "F"]),
                    "F": Set(["C", "E"])]

let graph2: GRAPH = ["A": Set(["B", "C"]),
                     "B": Set(["D", "E"]),
                     "C": Set(["F", "G"]),
                     "D": Set(["H", "I"])]

graph["K"] = Set(["A"])

var graph3: GRAPH2 = [1: Set([1, 0])]
graph3[2] = Set([2])

let visited = [String]()
//let dfs = DFS().dfs_recursive(graph, start: "A", visited: visited)
//let dfs2 = DFS().dfs_iterator(graph2, start: "A")
let dfs3 = DFS().dfs_paths(graph2, start: "A", goal: "F")
//print(dfs)
print(dfs3)
//print(dfs3)
//let sequence : Array<Int> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
