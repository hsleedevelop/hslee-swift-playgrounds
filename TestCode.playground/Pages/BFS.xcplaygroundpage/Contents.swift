import Foundation
import XCPlayground

//너비 우선
//typealias GRAPH = [String: Set<String>]

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
//let bfs2 = BFS().bfs_iterator(graph2, start: "A")
let bfs3 = BFS().bfs_paths(graph2, start: "A", goal: "F")
//print(bfs)
//print(bfs2)
print(bfs3)



//let bfs21 = BFS().bfs_recursive(graph2, start: "A", visited: visited, queue: queue)
//print(bfs21)
//      a
//  c         b
//f
