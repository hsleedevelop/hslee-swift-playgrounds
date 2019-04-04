import UIKit

var result: [Int]?

let isEmpty = result?.map { $0 > 0 }.contains(false) == false
print(isEmpty)

let arrangement = "()(((()())(())()))(())"
let arrangement2 = "(()())(())"
let arrangement3 = "(()())"


//var ar2 = arrangement3.replacingOccurrences(of: "()", with: " ")
//print(ar2)
//print(ar2.count)

var ar1 = arrangement2.replacingOccurrences(of: "()", with: "X")
//var ar2 = ar1.joined().components(separatedBy: "()")
print(ar1)
print(ar1.count)
//print(ar2)
//print(ar2.count)
//print(re)
//print(re.count)
//print(ar.)

let state = UIControl.State.
print(state)
