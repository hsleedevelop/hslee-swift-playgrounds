//: [Previous](@previous)

import Foundation
import XCPlayground

func makeTree(_ parent: Int, _ child: Int) -> (Int, Int) {
    return (parent, child)
}

func solution(_ numbers:[Int], _ target:Int) -> Int {
    
    var results = [Int]()
    var trees = [(Int, Int)]()
    for i in 1..<numbers.count {
        var tree = makeTree(numbers[i-1], numbers[i])
        trees.append(tree)
    }
    
    for node in trees {
        
    }
    
    //trees.
    
    print("trees=\(trees)")
    
//    -1+1+1+1+1 = 3
//    +1-1+1+1+1 = 3
//    +1+1-1+1+1 = 3
//    +1+1+1-1+1 = 3
//    +1+1+1+1-1 = 3
    
    
    return 0
}

let result = solution([1, 2, 3, 4, 5], 3)
print(result)
