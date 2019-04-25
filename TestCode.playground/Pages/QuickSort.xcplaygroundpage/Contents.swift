//: [Previous](@previous)

import Foundation

func quicksort<T: Comparable>(_ a: [T]) -> [T] {
    guard a.count > 1 else { return a }
    
    let pivot = a[a.count/2]
    let less = a.filter { $0 < pivot }
    let equal = a.filter { $0 == pivot }
    let greater = a.filter { $0 > pivot }
    
    return quicksort(less) + equal + quicksort(greater)
}

func quickSort2(_ a: [Int]) -> [Int] {
    guard a.count > 1 else { return a }
    
    let pivot = a[a.count/2] //finde pivot == log n
    let less = a.filter { $0 < pivot }
    let eqaul = a.filter { $0 == pivot }
    let greater = a.filter { $0 > pivot}
    
    return quickSort2(less) + eqaul + quickSort2(greater)
}

let list = [ 10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26 ]
//let result = quicksort(list)
let result = quickSort2(list)
print(result)
