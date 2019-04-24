//: [Previous](@previous)

import Foundation

func getMergeScore() {
    
}

func getBonusScore(_ index: Int, frames: [(Int, Int)]) -> Int {
    guard index < frames.count else { return 0 }
    
    var score = 0
    var i = index
    if frames[i].0 == 10 {//strike
        score = frames[i].0
        if i+1 < frames.count {
            if frames[i+1].0 == 10 {
                
            }
            score += i+1 < frames.count ? frames[i+1].0 + frames[i+1].1 : 0
            score += i+1 < frames.count ? frames[i+1].0 + frames[i+1].1 : 0
        }
        score += i+1 < frames.count ? frames[i+1].0 + frames[i+1].1 : 0
//        score += i+2 < frames.count ? frames[i+2].0 + frames[i+2].1 : 0
    } else if frames[i].0 + frames[i].1 == 10 {//spair
        score = frames[i].0 + frames[i].1
        score += i+1 < frames.count ? frames[i+1].0 : 0
    } else {
        score = frames[i].0 + frames[i].1
    }
    return score
}

func calculate(_ input: String) -> [Int] {//or 16진수?
    //var pins =
    var scores = [Int]()

    var frames = [(Int, Int)]()
    var pins = input.map { String($0) }
    var i = 0

    while i < pins.count {
        print("i=\(i)")
        if pins[i] == "A" {
            frames.append((10, 0))
            i += 1
        } else {
            let first = Int(pins[i]) ?? 0
            let second = Int(pins[i+1]) ?? 0
            frames.append((first, second))
            i += 2
        }
    }
    
    var score = 0
    var tempScore = 0
    var isSpare = false
    var isStrike = false
    
    for i in 0..<frames.count {
        score = score + getBonusScore(i, frames: frames) //curry?
        scores.append(score)
    }
    
//    for pin in frames {
//        if pin.0 == 10 {//if strike
//            isStrike = true
//            score += pin.0
//        } else if pin.0 + pin.1 >= 10 {//if spair
//            isSpare = true
//            score += pin.0 + pin.1
//        } else {
//            isSpare = false
//            isStrike = false
//            score += pin.0 + pin.1
//            scores.append(score)
//            score = 0
//        }
//    }
    
    //reduce?
    print(frames)
    print(scores)
    return [0]
}

//| AAAAAAAAAAAA | [ 30, 60, 90, 120, 150, 180, 210, 240, 270, 300 ] | 12frame
//| 82A900519A | [ 20, 39, 48, 53, 73 ] | 6frame

//let result = calculate("82A900519A")
let result = calculate("AAAAAAAAAAAA")
//let result = calculate("A82A90A0519A")
//let result = calculate("9180AA80A819181A91")

print(result)
//print(result2)
//print(result3)
