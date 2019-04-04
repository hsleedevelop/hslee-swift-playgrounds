//: [Previous](@previous)

import Foundation

//1번 수포자가 찍는 방식: [1, 2, 3, 4, 5], 1, 2, 3, 4, 5, ...
//2번 수포자가 찍는 방식: 2, 1, 2, 3, 2, 4, 2, 5, 2, 1, 2, 3, 2, 4, 2, 5, ...
//3번 수포자가 찍는 방식: 3, 3, 1, 1, 2, 2, 4, 4, 5, 5, 3, 3, 1, 1, 2, 2, 4, 4, 5, 5,

func solution(_ answers:[Int]) -> [Int] {
    
    let p1 = [1, 2, 3, 4, 5]
    let p2 = [2, 1, 2, 3, 2, 4, 2, 5]
    let p3 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    var results = [0, 0, 0]
    
    answers.enumerated().forEach { index, answer in
        print ("p1 >> \(p1[index % p1.count])")
        if p1[index % p1.count] == answer {
            results[0] += 1
        }
        
        if p2[index % p2.count] == answer {
            results[1] += 1
        }
        
        if p2[index % p3.count] == answer {
            results[2] += 1
        }
    }
    
    var a = (1, results[0])
    var b = (2, results[1])
    var c = (3, results[2])
    
    var max = a.1 > b.1 ? a.1 : b.1
    max = c.1 > max ? c.1 : max
    
    var pp = [Int]()
    if a.1 >= max {
        pp.append(a.0)
    }
    if b.1 >= max {
        pp.append(b.0)
    }
    if c.1 >= max {
        pp.append(c.0)
    }
    
    print (pp)
    return pp
}

solution([1,2,3,4,5])
solution([1,3,2,4,2])
