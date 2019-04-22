//: [Previous](@previous)

import Foundation

func heapSort<T: Comparable>(_ array: [T]) -> [T] {
    
    func shiftDown(_ arr: [T], start: Int, end: Int ) -> [T] {
        var array = arr
        var root = start
        
        while root * 2 + 1 <= end {//  (While the root has at least one child)
            let child = root * 2 + 1    // (root*2+1 points to the left child)
            var swap = root
            
            if array[swap] < array[child] {// (out of max-heap order)
                swap = child
            }
            
            if child + 1 <= end && array[swap] < array[child + 1] {//(If the child has a sibling and the child's value is less than its sibling's...)
                swap = child + 1    // (... then point to the right child instead)
            }
            
            if swap == root {
                return array
            } else {
                (array[root], array[swap]) = (array[swap], array[root])
                root = swap //repeat to continue sifting down the child now)
            }
        }
        return array
    }
    
    func heapify(_ arr: [T], count: Int) -> [T] {
        var start = (count - 2) / 2 //(start is assigned the index in a of the last parent node)
        var heapArray = arr
        while start >= 0 {//(sift down the node at index start to the proper place such that all nodes below the start index are in heap order)
            heapArray = shiftDown(heapArray, start: start, end: count - 1)
            start -= 1
        }
        //(after sifting down the root all nodes/elements are in heap order)
        return heapArray
    }
    
    var heaps = heapify(array, count: array.count) //(first place a in max-heap order)
    var end = array.count - 1
    while end > 0 {
        //(swap the root(maximum value) of the heap with the last element of the heap)
        (heaps[end], heaps[0]) = (heaps[0], heaps[end])
        //(decrement the size of the heap so that the previous max value will stay in its proper place)
        end -= 1
        //(put the heap back in max-heap order)
        heaps = shiftDown(heaps, start: 0, end: end)
    }
    
    return heaps
}

let list = [ 10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26 ]
//let result = quicksort(list)
let result = heapSort(list)
print(result)
