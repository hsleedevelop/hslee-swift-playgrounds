//: [Previous](@previous)

import Foundation

func getString(_ candi: String) -> String {
    
    if let regex = try? NSRegularExpression(pattern: "(.*//+.[^.]*\\.)([^.]*).*", options: []) {
        regex.match
    }
    return "xxx"
}


let aaa = "https://www.156centi.com"
//http://www.benign.co.kr"

let result = getString(aaa)
print(result)
