//: [Previous](@previous)

//변수 V의 초기 값을 이진수로 나타내는 N자로 구성된 0 색인 문자열 S가 주어짐
//위에서 설명한 대로 V의 값이 0이 되는 스텝 수를 반환함

//예를 들어 문자열 S = "011100"인 경우, 문자열 S는 숫자 28을 나타내고
//28은 7단계 후 0이 되므로 함수는 7을 반환해야 한다.

import Foundation
//import Glibc

// you can write to stdout for debugging purposes, e.g.
// print("this is a debug message")

public func solution(_ S : inout String) -> Int {
    guard let decimal = Int(S, radix: 2), decimal > 0, decimal < 1000000 else { return -1}
//    print(S)
    // write your code in Swift 4.2.1 (Linux)
//    print(int)
    
//    var decimal: Int = 0
//    for digit in S {
//        switch(digit) {
//        case "0":
//            decimal = decimal * 2
//        case "1":
//            decimal = decimal * 2 + 1
//        default:
//            break
//        }
//    }
//    print(decimal)
    
    var result = decimal
    var step = 0
    while result > 0 {
        if result % 2 == 0 {
            result /= 2
        } else {
            result -= 1
        }
        step += 1
    }
    
    print(step)
    return step
}

//var input = "011100"
//var input = "01110111011"
//var input = "01010101010101"
var input = "010101010101010101010"
let result = solution(&input)
