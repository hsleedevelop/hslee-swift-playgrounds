//: [Previous](@previous)

import Foundation

func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
    // 1
    var leftIndex = 0
    var rightIndex = 0
    
    // 2
    var orderedPile = [Int]()
    orderedPile.reserveCapacity(leftPile.count + rightPile.count)
    
    // 3
    while leftIndex < leftPile.count && rightIndex < rightPile.count {
        if leftPile[leftIndex] < rightPile[rightIndex] {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        } else if leftPile[leftIndex] > rightPile[rightIndex] {
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        } else {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
    }
    
    // 4
    while leftIndex < leftPile.count {
        orderedPile.append(leftPile[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < rightPile.count {
        orderedPile.append(rightPile[rightIndex])
        rightIndex += 1
    }
    
    return orderedPile
}

func mergeSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }    // 1
    
    let middleIndex = array.count / 2              // 2
    
    let leftArray = mergeSort(Array(array[0..<middleIndex]))             // 3
    
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))  // 4
    
    return merge(leftPile: leftArray, rightPile: rightArray)             // 5
}

//1. split
func mergeSort2(_ list: [Int]) -> [Int] {
    if list.count <= 1 {//정렬되지 않은 리스트를 n개의 서브리스트를 만들고 리스트의 개수가 1이라면 정렬된 것으로 처리합니다.
        return list     //1개의 서브리스트로 될때까지 정렬하면서 합칩니다.
    }
    
    var lList = [Int]()
    var rList = [Int]()
    
    let mid = list.count/2
    lList += list[0..<mid]
    rList += list[mid..<list.count]
    
    var left = mergeSort2(lList)
    var right = mergeSort2(rList)
    
    return merge2(&left, &right)
}

//2. merge
func merge2( _ left: inout [Int], _ right: inout [Int]) -> [Int] {
    var result = [Int]()
    while !left.isEmpty && !right.isEmpty {
        let value = left[0] < right[0] ? left.remove(at: 0) : right.remove(at: 0)
        result += [value]
    }
    
    if !left.isEmpty {
        result += left
    }
    
    if !right.isEmpty {
        result += right
    }
    
    return result
}


let array = [2, 1, 5, 4, 9, 10, -1, 3, 3, 8]
let result = mergeSort2(array)   // [1, 2, 4, 5, 9]
print(result)

