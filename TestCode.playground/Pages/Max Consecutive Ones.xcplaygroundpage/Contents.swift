//: [Previous](@previous)

import Foundation

class Solution {
    
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var result = 0
        var pre = -1
        var resultArray = [Int]()
        nums.forEach { num in
            print(num, pre)
            if num == pre {
                result += 1
            } else {
                if result > 1 {
                     resultArray.append(result)
                }
                result = 0
            }
            pre = num
        }
        if result > 1 {
            resultArray.append(result)
        }
        
        resultArray.sort { left, right -> Bool in
            right < left
        }
        print(resultArray)
        return resultArray.first ?? 0
    }
}

let input = [1,0,1,1,0,0,0,1,1,1,1]

let solution = Solution()
solution.findMaxConsecutiveOnes(input)

