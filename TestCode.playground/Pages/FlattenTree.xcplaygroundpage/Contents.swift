//: [Previous](@previous)

import Foundation
import XCPlayground

func loadLocalJSON() -> String {
    var jsonString = ""
    if let filepath = Bundle.main.path(forResource: "categories", ofType: "json") {
        do {
            jsonString = try String(contentsOfFile: filepath)
        } catch {
            print(error.localizedDescription)
        }
    }
    return jsonString
}

func getPlainText(_ source: String) -> String {
    let regex = try! NSRegularExpression(pattern: "[^a-zA-Z0-9ㄱ-ㅣ가-힣/\\s\n]", options: [])
    let range = NSRange(location: 0, length: source.count)
    let string = regex.stringByReplacingMatches(in: source, options: [], range: range, withTemplate: "")
    return string
}

func flattenTree(_ json: String) -> [String] {
    guard !json.isEmpty else { return [] }
    var results = [String]()
    let categories = json.replacingOccurrences(of: "{", with: "").components(separatedBy: "},")
    
    var firstCategory = ""
    var secondCategory = ""
    var thirdCategory = ""
    for category in categories {
        let splits = category.components(separatedBy: "\":\"")
        if splits.count > 2 {
            firstCategory = getPlainText(splits.first ?? "")
            secondCategory = getPlainText(splits.last ?? "")
//            print(">\(ca1)")
//            print(">>\(ca2)")
        } else if splits.count > 1 {
            secondCategory = getPlainText(splits.first ?? "")
//            print(">>\(ca2)")
        } else {
            thirdCategory = getPlainText(category)
            let prefix = "" //results.count > 0 ? ", " : ""
            let result = "\(prefix)\(firstCategory) > \(secondCategory) > \(thirdCategory)"
            results.append(result)
//            print(">>>\(ca3)")
//            print("\(result)")
        }
    }
    
    return results
}


let json = loadLocalJSON()
let result = flattenTree(json)
print(result)
