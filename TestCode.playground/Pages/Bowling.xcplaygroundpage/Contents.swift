//: [Previous](@previous)

import Foundation

func calculate(_ frames: String) -> [Int] {//or 16진수?
    //var pins =
    var scores = [Int]()
    var pinXX = [Int]()
    var frame = [Int](repeating: 0, count: 2)

    var ccc = [(Int, Int)]()
    var pins = frames.map { String($0) }
    var i = 0
    var score = 0
    while i < pins.count {
        print("i=\(i)")
        if pins[i] == "A" {
            ccc.append((10, 0))
            i += 1
        } else {
            let first = Int(pins[i]) ?? 0
            let second = Int(pins[i+1]) ?? 0
            ccc.append((first, second))
            i += 2
        }
    }
    
    var score = 0
    for xx in pins {
        
    }
    
    //reduce?
    print(ccc)
    return [0]
}

//| AAAAAAAAAAAA | [ 30, 60, 90, 120, 150, 180, 210, 240, 270, 300 ] | 12frame
//| 82A900519A | [ 20, 39, 48, 53, 73 ] | 6frame

//let result = calculate("82A900519A")
//let result2 = calculate("AAAAAAAAAAAA")
let result3 = calculate("A82A90A0519A")

//print(result)
//print(result2)
print(result3)
