import Foundation
import XCPlayground

//너비 우선
typealias GRAPH = [String: Set<String>]

open class BFS {
    public init() {}
    
    func bfs_recursive(_ graph: GRAPH, start: String, visited: [String], queue: [String]) -> [String] {
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
    
    //O(V+E)
    func bfs_iterator(_ graph: GRAPH, start: String) -> [String] {
        var visited = [String]()
        var queue = [start]
        
        while queue.count > 0 {
            let node = queue.removeFirst()
            if visited.contains(node) == false {
                visited.append(node)
                //print(visited)
                //queue.append(contentsOf: graph[node]?.subtracting(visited) ?? [])
                
                let subs = graph[node]?.subtracting(visited) ?? []
                print("\(node), \(visited), \(queue), subs=\(subs)")
                queue.append(contentsOf: subs)
//                for next in subs {
//                    queue.append(next)
//                }
                print("\(node), \(visited), \(queue)")
            }
        }
        return visited
    }
    
    func bfs_paths(_ graph: GRAPH, start: String, goal: String) -> [[String]] {
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

let graph: GRAPH = ["A": Set(["B", "C"]),
                    "B": Set(["A", "D", "E"]),
                    "C": Set(["A", "F"]),
                    "D": Set(["B"]),
                    "E": Set(["B", "F"]),
                    "F": Set(["C", "E"])]

let graph2: GRAPH = ["A": Set(["B", "C"]),
                    "B": Set(["D", "E"]),
                    "C": Set(["F", "G"]),
                    "D": Set(["H", "I"])]
//    ,
//                    "D": Set(["B"]),
//                    "E": Set(["B", "H"]),
//                    "F": Set(["C"]),
//                    "G": Set(["C"])]

let visited = [String]()
let queue = [String]()
//let bfs = BFS().bfs_recursive(graph, start: "A", visited: visited, queue: queue)
let bfs2 = BFS().bfs_iterator(graph, start: "A")
//let bfs2 = BFS().bfs_iterator(graph2, start: "A")
//let bfs3 = BFS().bfs_paths(graph, start: "A", goal: "F")
//print(bfs)
print(bfs2)
//print(bfs3)



//let bfs21 = BFS().bfs_recursive(graph2, start: "A", visited: visited, queue: queue)
//print(bfs21)
//      a
//  c         b
//f


//A, ["A"], [], subs=["B", "C"]
//A, ["A"], ["B", "C"]
//B, ["A", "B"], ["C"], subs=["D", "A", "E"]
//B, ["A", "B"], ["C", "D", "A", "E"]
//C, ["A", "B", "C"], ["D", "A", "E"], subs=["A", "F"]
//C, ["A", "B", "C"], ["D", "A", "E", "A", "F"]
//D, ["A", "B", "C", "D"], ["A", "E", "A", "F"], subs=["B"]
//D, ["A", "B", "C", "D"], ["A", "E", "A", "F", "B"]
//E, ["A", "B", "C", "D", "E"], ["A", "F", "B"], subs=["F", "B"]
//E, ["A", "B", "C", "D", "E"], ["A", "F", "B", "F", "B"]
//F, ["A", "B", "C", "D", "E", "F"], ["B", "F", "B"], subs=["E", "C"]
//F, ["A", "B", "C", "D", "E", "F"], ["B", "F", "B", "E", "C"]


//A, ["A"], [], subs=["B", "C"]
//A, ["A"], ["B", "C"]
//B, ["A", "B"], ["C"], subs=["D", "E"]
//B, ["A", "B"], ["C", "D", "E"]
//C, ["A", "B", "C"], ["D", "E"], subs=["F"]
//C, ["A", "B", "C"], ["D", "E", "F"]
//D, ["A", "B", "C", "D"], ["E", "F"], subs=[]
//D, ["A", "B", "C", "D"], ["E", "F"]
//E, ["A", "B", "C", "D", "E"], ["F"], subs=["F"]
//E, ["A", "B", "C", "D", "E"], ["F", "F"]
//F, ["A", "B", "C", "D", "E", "F"], ["F"], subs=[]
//F, ["A", "B", "C", "D", "E", "F"], ["F"]
//["A", "B", "C", "D", "E", "F"]
