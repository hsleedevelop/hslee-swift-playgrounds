//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
print(str)

var result = ""
func fibo(n: Int) -> Int {
    if n < 2 {
//        result += "\(n) "
        return n
    }
    
    let rrr = fibo(n-1) + fibo(n-2)
    result += "\(rrr) "
    return rrr
}

var input = 7
//for i in   0 ... input {
////    let result = fibo(i)
//    print(result)
//}

fibo(input)
print("\(result)\n")