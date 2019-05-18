//: [Previous](@previous)

import Foundation

func binarySearch(_ A: [Int], _ X: Int) -> Int? {//1,2,5,9,9
    var low = 0
    var upper = array.count - 1

    while low < upper {
        let index = (low + upper) / 2
        print("1 > \(low), \(upper), \(index)")
        
        if A[index] < X {//
            print("2 >> \(index)")
            low = index + 1
        } else {
            print("3 >>> \(index)")
            upper = index
            //low = index + 1 //2
        }
//        else {
//            break
//        }
//        else {
//            return index
//        }
    }
    if A[low] == X {
        print("4 >>>> \(low)")
        return low
    }
    return -1
    
//    while (true) {
//        print(">>>>>>> \(low), \(upper)")
//        let index = (low + upper) / 2
//        if array[index] == target {
//            print(">>> \(index)")
//            return index
//        } else if (low > upper) {//not found
//            return nil
//        } else {
//            if array[index] > target {//0 > 2
//                upper = index - 1
//            } else {// 0 < 2
//                low = index + 1
//            }
//        }
//    }
}

let array = [1,2,5,9,9]
let result = binarySearch(array, 9) ?? 0
print(result)



//int solution(NSMutableArray *A, int X) {
//    int N = [(A) count];
//    if (N == 0) {
//        return -1;
//    }
//    int l = 0;
//    int r = N - 1;
//    while (l < r) {
//        int m = (l + r) / 2;
//        if ([[A objectAtIndex: m] intValue] > X) {
//            r = m - 1;
//        } else if ([[A objectAtIndex: m] intValue] < X) {
//            l = m + 1;
//        }
//    }
//    if ([[A objectAtIndex: l] intValue] == X) {
//        return l;
//    }
//    return -1;
//}
