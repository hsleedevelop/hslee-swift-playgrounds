//: [Previous](@previous)

import Foundation

func solution3(_ priorities:[Int], _ location:Int) -> Int {
    
    var doc = priorities[location]
    var bubbles = priorities
    priorities.enumerated().forEach { primaryIndex, p in
        let passes = (bubbles.count - 1) - primaryIndex //decounter

        for secondaryIndex in 0..<passes {
            print("primaryIndex=\(primaryIndex), passes=\(passes), secondaryIndex=\(secondaryIndex)")
            let key = bubbles[secondaryIndex]
            
            if (key < bubbles[secondaryIndex + 1]) {
                bubbles.swapAt(secondaryIndex, secondaryIndex + 1)
            }
        }
    }
    
    var result = -1
    bubbles.enumerated().forEach { i, p in
        if p == doc {
            result = i
            return
        }
    }
    
    
    print(bubbles)
    print(result + 1)
    return result
}

func solution2(_ priorities:[Int], _ location:Int) -> Int {
    var cPriorities = priorities
    var targetIndex = location
    var seq = 0
    
    while cPriorities.count > 0 {
        if cPriorities.contains(where: { $0 > cPriorities[0] }) {
            let first = cPriorities.removeFirst()
            cPriorities.append(first)
            targetIndex = targetIndex - 1 < 0 ? cPriorities.count - 1 : targetIndex - 1
        } else {
            if(targetIndex == 0) {
                print(priorities.count - cPriorities.count + 1)
                return priorities.count - cPriorities.count + 1
            }
            
            cPriorities.removeFirst()
            targetIndex = targetIndex - 1
        }
    }
    
    return 0
}

func solution(_ priorities:[Int], _ location:Int) -> Int {
    
    var clones = priorities
    var index = location
    
    while clones.count > 0 {
        if clones.contains(where: { clone -> Bool in
            print(">> \(clone), >>>\(clones), index=\(index)")
            return clone > clones[0]
        }) {
        //if clones.contains(where: { clone in $0 > clones[0]}) {//is not bigger
            let first = clones.removeFirst()
            clones.append(first)
            index = index - 1 < 0 ? clones.count - 1 : index - 1
        } else {//is bigger
            if index == 0 {
                print(priorities.count - clones.count + 1)
                return priorities.count - clones.count + 1
            }
            
            clones.removeFirst()
            index = index - 1
        }
    }
    
    return 0
}

//solution([2, 1, 3, 2], 2)
//solution([1, 1, 9, 1, 1, 1], 5)
solution([1, 1, 9, 1, 1, 1], 2)
//[2, 1, 3, 2]    2    1
//[1, 1, 9, 1, 1, 1]    0    5
