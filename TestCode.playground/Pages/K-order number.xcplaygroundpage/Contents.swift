//: [Previous](@previous)

import Foundation

//문제 설명
//배열 array의 i번째 숫자부터 j번째 숫자까지 자르고 정렬했을 때, k번째에 있는 수를 구하려 합니다.
//
//예를 들어 array가 [1, 5, 2, 6, 3, 7, 4], i = 2, j = 5, k = 3이라면
//
//array의 2번째부터 5번째까지 자르면 [5, 2, 6, 3]입니다.
//1에서 나온 배열을 정렬하면 [2, 3, 5, 6]입니다.
//2에서 나온 배열의 3번째 숫자는 5입니다.
//배열 array, [i, j, k]를 원소로 가진 2차원 배열 commands가 매개변수로 주어질 때, commands의 모든 원소에 대해 앞서 설명한 연산을 적용했을 때 나온 결과를 배열에 담아 return 하도록 solution 함수를 작성해주세요.
//
//제한사항
//array의 길이는 1 이상 100 이하입니다.
//array의 각 원소는 1 이상 100 이하입니다.
//commands의 길이는 1 이상 50 이하입니다.
//commands의 각 원소는 길이가 3입니다.

func solution2(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var answer:[Int] = []
    for i in commands {
        var newArray = Array(array[i[0]-1...i[1]-1])
        newArray.sort()
        answer.append(newArray[i[2]-1])
    }
    return answer
}

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    
    func sort(_ arr: [Int]) -> [Int] {
        var sarray = arr
        for i in 0..<sarray.count {
            let pass = (sarray.count - 1) - i
            for j in 0..<pass {
                if sarray[j] > sarray[j+1] {
                    sarray.swapAt(j, j+1)
                }
            }
        }
        return sarray
    }
    
    func nestedCalculate(_ command: [Int]) -> Int {
        let s = command[0]
        let e = command[1]
        let f = command[2]
        
        var cutted = [Int]()
        for i in s...e {
            cutted.append(array[i-1])
        }
        var sarray = sort(cutted)
        //print("cutted=\(cutted), sarray=\(sarray), f=\(f)")
        return sarray[f-1]
    }
    
    var results = [Int]()
    for command in commands {
        let result = nestedCalculate(command)
        results.append(result)
    }
    
    return results
}

//[1, 5, 2, 6, 3, 7, 4]    [[2, 5, 3], [4, 4, 1], [1, 7, 3]]
let result = solution([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]])
print(result)
