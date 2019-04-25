//: [Previous](@previous)

import Foundation

func getMergeScore() {
    
}

//Strike = next, next
//Spair = next

func calculate(_ input: String) -> [Int] {//or 16진수?
    let match = try! NSRegularExpression(pattern: "[^0-9A]", options: []).firstMatch(in: input, options: [], range: NSRange(location: 0, length: input.count))
    guard !input.isEmpty && match == nil else { return [] }
    
    var pins = input.map { String($0) }
    var frames = [(Int, Int)]()
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
    
    let count = min(frames.count, 10)
    var scores = [Int]()
    var score = 0
    
    for i in 0..<count {
        
        if frames[i].0 == 10 {
            if i + 2 < frames.count, frames[i+1].0 == 10  {
                //score = frames[i].0
                score = frames[i].0 + frames[i].1
                score += frames[i+1].0 + frames[i+2].0
                print("st1 \(i) \(score)")
            } else if i + 1 < frames.count {
                //score = frames[i].0
                score = frames[i].0 + frames[i].1
                score += frames[i+1].0 + frames[i+1].1
                print("st2 \(i) \(score)")
            }
            //prev = frames[i]
//            continue
        } else if (frames[i].0 + frames[i].1) == 10 {
            if i + 1 < frames.count {
                score = frames[i].0 + frames[i].1
                score += frames[i+1].0
            }
            print("sp \(i) \(score)")
//            continue
        } else {
            score = frames[i].0 + frames[i].1
        }
        
        
        print(">> \(i) \(score)")
        if score > 0 {
            scores.append((scores.last ?? 0) + score)
        }
        score = 0
    }
    
    //for i in (0..<frames.count).reversed() {
//    for i in 0..<count {
//        score += frames[i].0 + frames[i].1
//        if frames[i].0 == 10, i + 1 < frames.count {
//            if frames[i+1].0 == 10, i + 2 < frames.count {
//                score += frames[i+1].0 + frames[i+2].0
//            } else {
//                score += frames[i+1].0 + frames[i+1].1
//            }
//            print("st \(i) \(score)")
//            //prev = frames[i]
////            continue
//        } else if (frames[i].0 + frames[i].1) == 10, i + 1 < frames.count {
//            score += frames[i+1].0
//            print("sp \(i) \(score)")
////            continue
//        }
//
//
//        print(">> \(i) \(score)")
//        scores2.append((scores2.last ?? 0) + score)
//        score = 0
//    }
    
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
//    print(scores)
    print(scores)
    return [0]
}

func calculate2(_ input: String) -> [Int] {//or 16진수?
    let match = try! NSRegularExpression(pattern: "[^0-9A]", options: []).firstMatch(in: input, options: [], range: NSRange(location: 0, length: input.count))
    guard !input.isEmpty && match == nil else { return [] }
    
    var pins = input.map { String($0) }
    var frames = [(Int, Int)]()
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
    
    let count = min(frames.count, 10)
    var scores = [Int]()
    var score = 0
    
    for i in 0..<count {
        if var score = getScore(i, frames: frames, count: 1), score > 0 {
            scores.append((scores.last ?? 0) + score)
        }
    }
    
    print("scores=\(scores)")
    return [0]
}

func getScore(_ i: Int, frames: [(Int, Int)], count: Int) -> Int? {
    guard i < frames.count, count > 0 else { return nil }
    //var array = [Int]()
    var score = frames[i].0 + frames[i].1
    var lcount = count - 1
    if frames[i].0 == 10 {
        score += (getScore(i+1, frames: frames, count: 1) ?? 0)
    }
    print("score=\(score), i=\(i)")
    //print(array)
    return score
}


//| AAAAAAAAAAAA | [ 30, 60, 90, 120, 150, 180, 210, 240, 270, 300 ] | 12frame
//| 82A900519A | [ 20, 39, 48, 53, 73 ] | 6frame

//https://www.bowlinggenius.com/

//let result = calculate("10")
//let result = calculate("102727272727")
//let result = calculate("82A900519A")      //20, 39, 48, 53, 73
//let result = calculate("AAAAAAAAAAAA")
//let result = calculate("AAAAAAAAAAAB")
//let result = calculate("A82A90A0519A")  //20, 40, 59, 68, 83, 88, 108
//let result = calculate("9180AA80A819181A91") //18, 26, 54, 72, 80, 99, 108, 126, 135, 155

//print(result)

//print(result3)

//let result2 = calculate2("102727272727")
//let result2 = calculate2("82A900519A")      //20, 39, 48, 53, 73
let result2 = calculate2("AAAAAAAAAAAA")
//let result2 = calculate2("AAAAAAAAAAAB")
//let result2 = calculate2("A82A90A0519A")  //20, 40, 59, 68, 83, 88, 108
//let result2 = calculate2("9180AA80A819181A91") //18, 26, 54, 72, 80, 99, 108, 126, 135, 155

print(result2)
