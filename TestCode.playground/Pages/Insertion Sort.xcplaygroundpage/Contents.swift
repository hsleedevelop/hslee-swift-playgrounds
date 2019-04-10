//: [Previous](@previous)

import Foundation

func insertionSort(_ array: [Int]) -> [Int] {
    var a = array             // 1
    for x in 1..<a.count {         // 2
        var y = x
        print("\(y)")
        while y > 0 && a[y] < a[y - 1] { // 3
            print(">> \(y), \(y-1)")
            print(">> \(a[y]), \(a[y - 1])")
            a.swapAt(y - 1, y)
            y -= 1
        }
    }
    return a
}

let list = [ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ]
let result = insertionSort(list)

print(result)