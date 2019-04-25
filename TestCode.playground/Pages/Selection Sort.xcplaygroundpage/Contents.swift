//: [Previous](@previous)

import Foundation

func selectionSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array}
    
    var arr = array
    
    for i in 0..<arr.count - 1 {
        var lowest = i
        
        for j in i + 1 ..< arr.count {
            if arr[j] < arr[lowest] {
                lowest = j
            }
        }
        
        if i != lowest {
            arr.swapAt(i, lowest)
        }
    }
    
    return arr
}

let list = [ 10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26 ]
//let result = quicksort(list)
let result = selectionSort(list)
print(result)
