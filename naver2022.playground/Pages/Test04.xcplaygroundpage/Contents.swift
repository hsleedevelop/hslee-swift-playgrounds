//: [Previous](@previous)

import Foundation


var rounds: [String] = []
let competition: [String] = []

var robots = 5
var roundsCount = 5

func test(_ input: String) {
    
    rounds.append(input)
    
    print("inputs=\(rounds)")
    
    let result = ""
    print("result=\(result)")
}

func solution() -> Int {
    var records: [Int: Int] = [:]
    for i in 1...robots {
        records[i] = 0
    }
    
    for round in rounds {
        let result = round.split(separator: " ").compactMap { Int($0) }
        if let winner = result.first, let looser = result.last {
            if let score = records[winner] {
                records[winner] = score + 1
            }
            if let score = records[looser] {
                records[looser] = score - 1
            }
        }
    }
    
    var score = -5000
    var ranks = 0
    for i in 1...robots {
        score = records[i] ?? -5000
        
        if records.filter({ $0.value == score }).count == 1 {
            ranks += 1
            //print("records.filter=\(score)")
        }
    }
    
    print("records=\(records)")
    return ranks
}

//let _ = test("5 5")
let _ = test("4 3")
let _ = test("4 2")
let _ = test("3 2")
let _ = test("1 2")
let _ = test("2 5")

 if robots > 1, robots <= 100, roundsCount > 0, roundsCount <= 4500 {
     let result = solution()
     print("result=\(result)")
 } else {
     print("0")
 }
