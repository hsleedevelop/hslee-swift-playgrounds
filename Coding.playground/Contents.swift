//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
print(str)

//var result = ""
//func fibo(n: Int) -> Int {
//    if n < 2 {
////        result += "\(n) "
//        return n
//    }
//
//    let rrr = fibo(n-1) + fibo(n-2)
//    result += "\(rrr) "
//    return rrr
//}
//
//var input = 7
////for i in   0 ... input {
//////    let result = fibo(i)
////    print(result)
////}
//
//fibo(input)
//print("\(result)\n")

let date1 = Date(timeIntervalSinceNow: -10)
let date2 = Date(timeIntervalSinceNow: 10)

print(date1)
print(Date())
print(date2)

DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    print(date1.timeIntervalSinceNow)
    print(Date().timeIntervalSinceNow)
    print(date2.timeIntervalSinceNow)    
}


let count = 1
if count ~= 11 {
    print("in")
} else {
    print("nin")
}
