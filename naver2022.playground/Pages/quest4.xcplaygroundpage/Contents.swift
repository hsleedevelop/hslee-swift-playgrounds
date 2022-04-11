import Foundation

class Test2 {
    
    func solution() {
     
        let aaa = [1, 2, 3]
        let bbb = [1, 2, 3]
        
//        let aaa = [1, 2]
//        let bbb = [1, 2, 3, 4]
        
//        let aaa = [1, 2, 3, 4]
//        let bbb = [1, 2]
                
//        let aaa = [-1, 2]
//        let bbb = [1, 2, 3, 4] //2,4,3,4
        
        let result1 = aaa + bbb
    }
}

extension Array where Element == Int {
    public static func +(array1: [Int], array2: [Int]) -> [Int] {
        // start here
        var bigArray, smallArray: [Int]!
        var countOfSmallArray = 0

        if array1.count > array2.count {
            bigArray = array1; smallArray = array2
            countOfSmallArray = array2.count
        } else {
            bigArray = array2; smallArray = array1
            countOfSmallArray = array1.count
        }

        for i in 0 ..< countOfSmallArray {
            bigArray[i] = abs(bigArray[i]) + abs(smallArray[i])
        }
        return bigArray
    }
    
//    public static func +(array1: [Int], array2: [Int]) -> [Int] {
//        var result: [Int]!
//        var minCount = 0
//
//        if array1.count > array2.count {
//            result = array1; minCount = array2.count
//        } else {
//            result = array2; minCount = array1.count
//        }
//
//        let result2 = result.enumerated().map { xxx in
//            result[i] = abs(result[i]) + abs(array1[i])
//            xxx.offset
//        }
//
//        for i in 0 ..< minCount {
//            result[i] = abs(result[i]) + abs(array1[i])
//        }
//        return result
//    }
}
