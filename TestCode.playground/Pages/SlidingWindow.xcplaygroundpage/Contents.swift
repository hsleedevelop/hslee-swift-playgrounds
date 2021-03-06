//: [Previous](@previous)

import Foundation

func slide(_ array: [Int], _ w: Int) {
    if array.count == 0 || w <= 0 {
        return
    }
    
    var window = [Int]()
    
    for i in 0..<array.count {
        while window.count > 0 && (window.first ?? 0) < i - w + 1 {//0 - 2 + 1 = - 1, 0, 1, 2, 3, 4, 5,
            print("removeFirst >> (i)=\(i), (w+1)=\(i - w + 1 ), widow =\(window)")
            window.removeFirst()
        }
        
        while window.count > 0 && array[(window.last ?? 0)] < array[i] {//2 < 1, 
            print("removeLast >> window.last)=\(array[(window.last ?? 0)]), (array[i])=\(array[i]), widow =\(window)")
            window.removeLast()
        }
        
        window.append(i) //0, 1, 2, 3, 4, -->
        print("window.append(i)=\(i), widow =\(window)")
        
        if i >= w - 1 {//마지막 0 >= 2 - 1, 1 >= 2 - 1,
            let result = array[window.first ?? 0]
            print(result)
        }
    }
}

slide([2, 1, 2, -1, 3], 2)
