//: [Previous](@previous)

import Foundation

func solution2(_ numbers:[Int]) -> String {
    var clones = numbers
    var new = [Int]()
    
    for i in 0..<clones.count {
        var n = "\(clones[i])"
        print(n)
    }
    return ""
}

func solution3(_ numbers:[Int]) -> String {
    var clones = numbers
    var new = Set<Int>()
    
    for i in 0..<clones.count {
        var n = "\(clones[i])"
        var n2 = "\(clones[i])"
        for j in 0..<clones.count {
//            print("\(clones[j])")
            if clones[i] != clones[j] {
                n = "\(n)\(clones[j])"
                n2 = "\(clones[j])\(n2)"
            }
        }
        new.insert(Int(n) ?? 0)
        new.insert(Int(n2) ?? 0)

        var n3 = "\(clones[i])"
        var n4 = "\(clones[i])"
        for j in (0..<clones.count).reversed() {
            //            print("\(clones[j])")
            if clones[i] != clones[j] {
                n3 = "\(n3)\(clones[j])"
                n4 = "\(clones[j])\(n4)"
            }
        }
        
        new.insert(Int(n3) ?? 0)
        new.insert(Int(n4) ?? 0)
    }

    var nums = [Int](new)
    
    for i in 0..<nums.count {
        let pass = (nums.count - 1) - i
        for j in 0..<pass {
            if nums[j] < nums[j+1] {
                nums.swapAt(j, j+1)
            }
        }
    }
    
//    print(clones)
    print(new)
    print(nums)
    return "\(nums.first ?? 0)"
}

func solution(_ numbers:[Int]) -> String {
    var clones = numbers
    var new = [Int]()
    
    for i in 0..<clones.count {
        var n = "\(clones[i])"
        var n2 = "\(clones[i])"
        for j in 0..<clones.count {
            //            print("\(clones[j])")
            if clones[i] != clones[j] {
                n = "\(n)\(clones[j])"
                n2 = "\(clones[j])\(n2)"
            }
        }
        
        new.append(Int(n) ?? 0)
        new.append(Int(n2) ?? 0)
        
        var n3 = "\(clones[i])"
        var n4 = "\(clones[i])"
        for j in (0..<clones.count).reversed() {
            //            print("\(clones[j])")
            if clones[i] != clones[j] {
                n3 = "\(n3)\(clones[j])"
                n4 = "\(clones[j])\(n4)"
            }
        }
        
        new.append(Int(n3) ?? 0)
        new.append(Int(n4) ?? 0)
    }
    
    var nums = [Int](new)
    
    for i in 0..<nums.count {
        let pass = (nums.count - 1) - i
        for j in 0..<pass {
            if nums[j] < nums[j+1] {
                nums.swapAt(j, j+1)
            }
        }
    }
    
    //    print(clones)
    print(new)
    print(nums)
    return "\(nums.first ?? 0)"
}

func solution4(_ numbers: [Int]) -> String {
//    let sortedNumbers = numbers.sorted {
//        Int("\($0)\($1)")! > Int("\($1)\($0)")!
//    }
    
    let sorted = numbers.sorted { (l, f) -> Bool in
        print("\(l)\(f), \(f)\(l)")
        return Int("\(l)\(f)")! > Int("\(f)\(l)")!
    }
    
    print(sorted)
    let answer = sorted.map { String($0) }.reduce("") { $0 + $1 }
    return sorted.first == 0 ? "0" : answer
}

//let result = solution([6, 10, 2])
//let result = solution4([3, 30, 34, 5, 9])
let result = solution4( [ 57, 589, 51, 5, 10, 20, 30, 44, 509, 5001, 32, 31, 6, 19, 1234 ])
print(result)
