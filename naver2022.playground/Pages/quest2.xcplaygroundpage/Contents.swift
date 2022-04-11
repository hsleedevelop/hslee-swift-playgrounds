import UIKit

func combination(_ nums: inout [Int], _ count: Int) -> Int {
    var sum = 0
    var index = 0
    for i in 0..<nums.count {
        print("count + i=\(count + i), nums.count=\(nums.count)")
        guard (count + i) <= nums.count else { break }
        let permute = nums[i..<count+i].reduce(0) { $0 + $1}
        if permute > sum {
            sum = permute
            index = i
            print("permute=\(permute), index = \(i)")
        }
    }
    
    if (index+count) < nums.count {
        nums = Array(nums[(index+count)...nums.count-1])        
    }
    print("news=\(nums)")
    return sum
}

public func solution(_ A : inout [Int], _ K : Int, _ L : Int) -> Int {
    guard A.count >= K + L else { return -1 }
            
    let resK = combination(&A, K)
    print("resK=\(resK)")
    print("A=\(A)")
    
    guard A.count >= L else { return -1 }
    
    let resL = combination(&A, L)
    print("resL=\(resL)")
    
    return resK + resL
}

var apples = [6, 1, 4, 6, 3, 2, 7, 4]
let k = 3
let l = 2
let result = solution(&apples, k, l)
print("result=\(result)")

