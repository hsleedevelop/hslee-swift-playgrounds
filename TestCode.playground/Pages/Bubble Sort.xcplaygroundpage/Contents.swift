//: [Previous](@previous)

import Foundation

func solution(_ ar: [Int]) -> [Int] {
    var array = ar
    for (i, value) in array.enumerated() {
        for (j, value) in array[0..<array.count-1].enumerated() {
            if array[j] > array[j+1] {
                array.swapAt(j, j+1)
            }
        }
    }
    return array
}

func solution2(_ ar: [Int]) -> [Int] {
    var array = ar
    for i in 0..<array.count {
        let pass = (array.count - 1) - i
        for j in 0..<pass {
            if array[j] > array[j+1] {
                array.swapAt(j, j+1)
            }
        }
    }
    return array
}


let list = [ 10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26 ]
//let result = quicksort(list)
let result = solution2(list)
print(result)
