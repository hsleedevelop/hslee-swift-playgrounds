//: [Previous](@previous)

import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    
    var wait_trucks = truck_weights
    var i = 0
    var bridge = [Int](repeating: 0, count: bridge_length)
    
    while wait_trucks.count > 0 || 0 < bridge.reduce(0){ $0 + $1 } {
        bridge.removeFirst()
        let sum = bridge.reduce(0) { $0 + $1 } + (wait_trucks.first ?? 0)
        if sum <= weight, wait_trucks.count > 0 {
            bridge.append(wait_trucks.removeFirst())
        } else {
            bridge.append(0)
        }
        print(bridge.count)
        
        i += 1
    }
    return i
}

func solution2(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    
    var wait_trucks = truck_weights
    var i = 0
    var bridge = [Int](repeating: 0, count: bridge_length)
    print(bridge.count)
    
    while wait_trucks.count > 0 || 0 < bridge.reduce(0){ $0 + $1 } {
//    while wait_trucks.count > 0 {
//    while wait_trucks.count > 0 {
        bridge.removeFirst()
        let sum = bridge.reduce(0) { $0 + $1 } + (wait_trucks.first ?? 0)
        if sum <= weight, wait_trucks.count > 0 {
            //bridge.removeFirst()
            bridge.append(wait_trucks.removeFirst())
            print("in >> \(bridge)")
//            bridge.insert(wait_trucks.removeFirst(), at: bridge.count - 1)
        } else {
            //bridge.removeFirst()
            bridge.append(0)
            print("out >> \(bridge)")
        }
        print(bridge.count)
        
        i += 1
    }
    
    print("cross=\(i)")
    return i
}


//solution(2, 10, [7,4,5,6])
//solution2(2, 10, [7,4,5,6])
//solution(100, 100, [10])
//solution(100, 100, [10,10,10,10,10,10,10,10,10,10])


var bridge = [2,3] //[Int](repeating: 0, count: 2)
print(bridge.count)
let xxx = bridge.reduce(0) { $0 + $1 }
print(xxx)
