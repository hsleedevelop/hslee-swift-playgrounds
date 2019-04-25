//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//BigO : O(log N)
//정렬된 자료를 반으로 나누어 탐색하는 방법
//주의점 : 자료는 오름차순 으로 정렬된 자료여야 한다.
//이진트리, 바이너리서치는 코딩 인터뷰 단골문제
//퍼포먼스가 아주 좋고 구현하는 중에 dynamic programming, recursion을 볼 수 있다.
//insert sort (삽입정렬), bubble sort, selection sort는 O(n^2)의 성능을 갖고 있다. (참고)

func binarySearch(_ array: [Int], _ target: Int) -> Int? {
    var low = 0
    var upper = array.count - 1
    
    while (true) {
        print(">>>>>>> \(low), \(upper)")
        let index = (low + upper) / 2
        if array[index] == target {
            print(">>> \(index)")
            return index
        } else if (low > upper) {//not found
            return nil
        } else {
            if array[index] > target {//0 > 2
                upper = index - 1
            } else {// 0 < 2
                low = index + 1
            }
        }
    }
}

let array = [1,2,3]
let result = binarySearch(array, 2) ?? 0
print(result)
