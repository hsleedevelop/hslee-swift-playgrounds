//: [Previous](@previous)

import Foundation

let resutls = [1,2,3,4,5].filter {
    print($0)
    return $0 > 3
}
let resutls2 = [1,2,3,4,5].lazy.filter {
    print($0)
    return $0 > 3
}

print(Array(resutls2))

//: [Next](@next)
