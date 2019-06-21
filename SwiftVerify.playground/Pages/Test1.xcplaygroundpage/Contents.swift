//: Playground - noun: a place where people can play

import UIKit


var array = [1,2,3]
//var s1 = MemoryLayout.size(array)
var s2 = MemoryLayout.size(ofValue: array)
print(s2)

class JSON {
    static var json: String = "AAA"
}

var str = "Hello, playground"
withUnsafePointer(to: &str) {
    print(" str value \(str) has address: \($0)")
}

var test = "lysnapi://xxx.com"
var bound = test.range(of: "lysnapi://")?.upperBound.encodedOffset
print(bound)

var find = test.suffix(test.range(of: "lysnapi://")?.upperBound.encodedOffset ?? 0)
var find2 = test.prefix(test.range(of: "lysnapi://")?.upperBound.encodedOffset ?? 0)
var find3 = test[test.range(of: "lysnapi://")!.upperBound...]
var find4 = test[..<test.endIndex]
var find5 = test[(test.range(of: "lysnapi://")?.upperBound ?? test.startIndex)...]

print(find)
print(find2)
print(find3)
print(find4)
print(find5)


let array2 = [1, 2, 4, 5, 3, 7]
let element = array2.map{ $0 * 2 }[3]
print(element)

/// Avoid creating multiple layers of `LazySequence` wrapper.
/// Anything conforming to `LazySequenceProtocol` is already lazy.
extension LazySequenceProtocol {
    /// Identical to `self`.
//    public var lazy: Self { get }
}

let array3 = [1, 2, 4, 5, 3, 7]
let element3 = array3.lazy.map{ $0 * 2 }[3]
print(element3)

