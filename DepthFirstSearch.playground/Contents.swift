//: Playground - noun: a place where people can play

import XCPlayground

//:![1](sampleGraph.png)


// Sample Graph
let adjacencyList = AdjacencyList<String>()

let s = adjacencyList.createVertex(data: "S")
let a = adjacencyList.createVertex(data: "A")
let b = adjacencyList.createVertex(data: "B")
let c = adjacencyList.createVertex(data: "C")
let d = adjacencyList.createVertex(data: "D")
let f = adjacencyList.createVertex(data: "F")
let g = adjacencyList.createVertex(data: "G")
let e = adjacencyList.createVertex(data: "E")

adjacencyList.add(.undirected, from: s, to: a)
adjacencyList.add(.undirected, from: a, to: b)
adjacencyList.add(.undirected, from: a, to: d)
adjacencyList.add(.undirected, from: a, to: c)
adjacencyList.add(.undirected, from: b, to: d)
adjacencyList.add(.undirected, from: d, to: g)
adjacencyList.add(.undirected, from: d, to: f)
adjacencyList.add(.undirected, from: f, to: e)

adjacencyList.description



func depthFirstSearch(from start: Vertex<String>, to end: Vertex<String>, graph: AdjacencyList<String>) -> Stack<Vertex<String>> {
  var visited = Set<Vertex<String>>()
  var stack = Stack<Vertex<String>>()
  
  stack.push(start)
  visited.insert(start)
  
  outer: while let vertex = stack.peek(), vertex != end {
  
    guard let neighbours = graph.edges(from: vertex), neighbours.count > 0 else {
      print("backtrack from \(vertex)")
      stack.pop()
      continue
    }
    
    for edge in neighbours {
      if !visited.contains(edge.destination) {
        visited.insert(edge.destination)
        stack.push(edge.destination)
        print(stack.description)
        continue outer
      }
    }
    
    print("backtrack from \(vertex)")
    stack.pop()
    
  }
  return stack
}



print(depthFirstSearch(from: s, to: e, graph: adjacencyList))

