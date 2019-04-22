//: [Previous](@previous)

import Foundation
import UIKit

//static var formatter = NumberFormatter()
//func numberString(_ num) -> String? {
//
//    String.formatter.numberStyle = NumberFormatter.Style.decimal
//    String.formatter.groupingSeparator = ","
//    String.formatter.groupingSize = 3
//
//    return String.formatter.string(from: self.number)
//}

print("Int   :  \(Int.min) >> \(Int.max)")
print("Int8   :  \(Int8.min) >> \(Int8.max)")
print("Int16   :  \(Int16.min) >> \(Int16.max)")
print("Int32   :  \(Int32.min) >> \(Int32.max)")
print("Int64   :  \(Int64.min) >> \(Int64.max)")

//Int8   :  -128 >> 127
//Int16   :  -32,768 >> 32,767
//Int32   :  -2147483648 >> 2,147,483,647
//Int64   :  -9,223,372,036,854,775,808 >> 9,223,372,036,854,775,807


print("Double   :  \(Double.leastNormalMagnitude) >> \(Double.greatestFiniteMagnitude)")
print("Double2   :  \(Double.leastNonzeroMagnitude) >> \(Double.greatestFiniteMagnitude)")

print("Float   :  \(Float.leastNonzeroMagnitude) >> \(Float.greatestFiniteMagnitude)")
print("Float2   :  \(Float.leastNonzeroMagnitude) >> \(Float.greatestFiniteMagnitude)")
