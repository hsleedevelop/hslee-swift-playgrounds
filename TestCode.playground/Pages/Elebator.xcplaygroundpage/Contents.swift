//: [Previous](@previous)

import Foundation

//0..M
//X 인원 용량 =
//Y 무게 =
//무게 A[K], target B[K]

var str = "Hello, playground"

//: [Next](@next)


public func solution(_ A : inout [Int], _ B : inout [Int], _ M : Int, _ X : Int, _ Y : Int) -> Int {
    
    var stops = 0
    var current = 0
    
    var people: [(Int, Int)] = A.enumerated().map { ($0.element, B[$0.offset]) } //people weights, destination
    var elevator: [(Int, Int)] = []
    
    while people.count > 0 || elevator.count > 0 {
        let has = (elevator.reduce(0, { $0 + $1.0 }) + (people.first?.0 ?? 0))
        print(has, has < Y)
        if elevator.count < X, has < Y,  people.count > 0, current == 0 {
            let person = people.removeFirst()
            elevator.append(person)
            print(elevator)
            elevator.sort { lhs, rhs -> Bool in
                return lhs.1 < rhs.1
            }
            print(elevator)
        } else if elevator.count > 0 {
            print(">> ")
            let passenger = elevator.removeFirst()
            current = passenger.1
            elevator.removeAll(where: {$0.1 == current})
            stops += 1
            print(">> out = \(elevator)")
        }

        if elevator.count == 0 {
            current = 0
            stops += 1
        }
    }
    
    print("stops=\(stops)")
    return stops
}

//([60, 80, 40], [2, 3, 5], 5, 2, 200)
var a = [80, 60, 40]
var b = [3, 2, 5]
var m = 5 //층수
var x = 2 //사람수
var y = 200 //몸무게
let result = solution(&a, &b, m, x, y) //5

