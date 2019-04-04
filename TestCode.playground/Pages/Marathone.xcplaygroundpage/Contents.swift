//: [Previous](@previous)

import Foundation

func solution(_ partcipant: [String], _ completion:[String]) -> String {
    var result = ""
    
    for completion in completion {
        for player in partcipant {
            if player == completion {
                break
            }
            result = player
        }
    }
//    partcipant.
//    completion.sort()
    
    return result
}

let looser = solution(["leo", "kiki", "eden"], ["eden", "kiki"])
print(looser)
