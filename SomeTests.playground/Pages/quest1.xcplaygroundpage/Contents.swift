//: [Previous](@previous)

import Foundation

func bin2dec(_ binArray: [Int]) -> Int {
    var number = 0
    var position = 0
    
    for i in binArray {
        if i == 1 {
            number += (1 << position)
        }
        position += 1
    }
    return number
}

func solution(sss: String) -> Int {
    guard sss.contains("1") == true else {
        return -1
    }
    guard sss.filter({$0 == "1"}).count >= 400000 else {
        return 799999
    }
    print("xxx=\(sss)")
    
    let binArray = sss.reversed().map { Int(String($0))! }
    print("binArray=\(binArray)")
    
    var number = bin2dec(binArray)
    let result = 0
    var count = 0
    while number > 0 {
        if number % 2 > 0 {
            number -= 1
        } else {
            number /= 2
        }
        count += 1
    }
    
    print("count=\(count)")
    return count
}


let result1 = solution(sss: "011100")
let result2 = solution(sss: "111")
let result3 = solution(sss: "1111010101111")
let result4 = solution(sss: "0")
