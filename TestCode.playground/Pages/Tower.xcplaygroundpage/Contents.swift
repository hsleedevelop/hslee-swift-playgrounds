//: [Previous](@previous)

import Foundation

func solution(_ heights:[Int]) -> [Int] {
    
    var receivedArray: [Int] = []
    
    for i in (0..<heights.count).reversed() {
        let signal = heights[i]
        for j in (0..<i).reversed() {
            if heights[j] > signal {
                print("received \(signal) > \(heights[j], j+1)")
                break
            }
        }
    }
    return []
}

solution([6,9,5,7,4])        //[0,0,2,2,4]
//solution([3,9,9,3,5,7,2])    //[0,0,0,3,3,3,6]
//solution([1,5,3,6,7,6,5])    //[0,0,2,0,0,5,6]
