//: [Previous](@previous)

import Foundation
import XCPlayground


func caculation(numbers: [Int], target: Int, index: Int, sum: Int) -> Int {
    if index == numbers.count {
        return sum == target ? 1 : 0
    }
    
    return caculation(numbers: numbers, target: target, index: index + 1, sum: sum + numbers[index]) + caculation(numbers: numbers, target: target, index: index + 1, sum: sum - numbers[index])
    
}

func solution3(_ numbers: [Int], _ target: Int) -> Int {
    return caculation(numbers: numbers, target: target, index: 0, sum: 0)
}


func dfs(_ numbers:[Int], _ index:Int, _ target:Int, _ sum:Int, _ dir: String) -> Int {
    print("\(numbers) >> \(index) >> \(sum) >> \(dir)")
    if index == numbers.count {
        return sum == target ? 1 : 0
    } else {
        return dfs(numbers, index+1, target, sum + numbers[index], "l") + dfs(numbers, index+1, target, sum - numbers[index], "r")
    }
}

func solution2(_ numbers:[Int], _ target:Int) -> Int {
    return dfs(numbers, 0, target, 0, "X")
}

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

let result = solution2([1, 2, 3], 3)
print(result)
