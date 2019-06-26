//: [Previous](@previous)

import Foundation

let resutls = [1,2,3,4,5].filter {
//    print($0)
    return $0 > 3
}

let resutls2 = [1,2,3,4,5].lazy.filter {
    print($0)
    return $0 > 3
}

let resutls3 = [1,2,3,4,5].first (where: {
//    print($0)
    return $0 > 3
})

let resutls4 = [1,2,3,4,5].lazy.first (where: {
//    print($0)
    return $0 > 3
})


//print(Array(resutls2))
print(resutls2.first)

//: [Next](@next)
