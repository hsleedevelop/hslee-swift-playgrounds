//: Playground - noun: a place where people can play

import UIKit


protocol ModelCodable: Codable {
    
}

protocol Bundle {
    var retype: ModelCodable.Type {get}
}

protocol Spec {
    associatedtype B: Bundle
}

class ModelA: ModelCodable {
    let name: String
    let nick: String
}

class ModelB: ModelCodable {
    let name: String
}

struct ModelC: ModelCodable {
    let nick: String
}

enum HomeBundle: Bundle {
    
    typealias M = ModelCodable
    
    case a
    case b
    case c
    
    var retype: M.Type {
        get {
            switch self {
            case .a:
                return ModelA.self
            case .b:
                return ModelB.self
            default:
                return ModelC.self
            }
        }
    }
}

struct DecodableWrapper: Decodable {
    static var baseType: Decodable.Type!
    var base: Decodable
    
    init(from decoder: Decoder) throws {
        self.base = try DecodableWrapper.baseType.init(from: decoder)
        print("base=\(self.base)")
    }
}

func test(bundle: Bundle) -> ModelCodable? {
    
    let exampleJSON = """
{
    "name": "Bob",
    "nick": "Jones"
}
""".data(using: .utf8)!
    
    let type = bundle.retype
//    let result = JSONDecoder().decode(type, from: exampleJSON)
//    print(DecodableWrapper.baseType)
    DecodableWrapper.baseType = type
//    print(DecodableWrapper.baseType)
    guard let result = try? JSONDecoder().decode(DecodableWrapper.self, from: exampleJSON).base else {
        return nil
    }
    
//    print(result)
    return result as? ModelCodable
}


if let result = test(bundle: HomeBundle.a) {
    
    let pres = result as! ModelA
    print(pres.name)
}

if let result = test(bundle: HomeBundle.b) as? ModelB {
    print(result.name)
}

if let result = test(bundle: HomeBundle.c) as? ModelC {
    print(result.nick)
}

func sum<T: ModelCodable>(a: T) throws -> Int {
    return 0
}

let sumFunc: (ModelA) throws -> Int = sum   //must could not be protocol

type(of: sumFunc)


let code: Int?
type(of: code!)




