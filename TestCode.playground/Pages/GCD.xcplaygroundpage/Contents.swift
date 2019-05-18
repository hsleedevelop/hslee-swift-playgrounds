//: [Previous](@previous)

import Foundation

//let queue = DispatchQueue(label: "hslee")
//queue.async {
//    for index in 1...5 {
//        print("hello, hslee \(index)")
//    }
//}

DispatchQueue.global().sync {
    var sum = 0
    for i in 1...5 {
        //usleep(10000)
        sum += i
        print("usleep")
    }
    print("================== \(sum)")
}


//DispatchQueue.global().async {
//    for i in 1...5 {
//        print(">> >> \(i)")
//    }
//    print("==================")
//}

for i in 100...105 {
    print(i)
}


