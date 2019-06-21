//: Playground - noun: a place where people can play

import UIKit


protocol ModelCodable: Codable {
    
}

protocol Bundle {
    var name: String { get }
    var retype: ModelCodable.Type {get}
}

protocol Spec {
    associatedtype B: Bundle
    
    var bundle: B { get }
}

enum BundleSpec: Spec {
    typealias B = HomeBundle
    case get(B)
    
    var bundle: B {
        get {
            switch self {
            case .get(let bundle):
                return bundle
            default:
                return HomeBundle.a
            }
        }
    }
    
    var desc: String {
        switch self {
        case .get(let bundle):
            return bundle.name
        default:
            return ""
        }
    }
}

struct BundleStruct {
    var bundle: Bundle
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

    var name: String {
        return "HomeBundle"
    }

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

class HomeBundle2: Bundle {
    typealias M = ModelCodable
    var bbtype: BType = .a

    enum BType {
        case a, b, c
    }

    var name: String {
        return "HomeBundle2"
    }

    var retype: M.Type {
        get {
            switch bbtype {
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

//struct DecodableWrapper: Decodable {
//    static var baseType: Decodable.Type!
//    var base: Decodable
//
//    init(from decoder: Decoder) throws {
//        self.base = try DecodableWrapper.baseType.init(from: decoder)
//        print("base=\(self.base)")
//    }
//}

func test2(spec: BundleSpec) {

    let type = spec.bundle.retype
    print("test2 >> \(type)")
}

func test3(spec: BundleStruct) {
    
    let type = spec.bundle.retype
    print("test2 >> \(type)")
}

//func test(bundle: Bundle) -> ModelCodable? {
//
//    let exampleJSON = """
//{
//    "name": "Bob",
//    "nick": "Jones"
//}
//""".data(using: .utf8)!
//
//    let type = bundle.retype
//    //    let result = JSONDecoder().decode(type, from: exampleJSON)
//    //    print(DecodableWrapper.baseType)
//    DecodableWrapper.baseType = type
//    //    print(DecodableWrapper.baseType)
//    guard let result = try? JSONDecoder().decode(DecodableWrapper.self, from: exampleJSON).base else {
//        return nil
//    }
//
//    //    print(result)
//    return result as? ModelCodable
//}
//
//
////if let result = test(bundle: HomeBundle.a) {
////
////    let pres = result as! ModelA
////    print(pres.name)
////}
////
////if let result = test(bundle: HomeBundle.b) as? ModelB {
////    print(result.name)
////}
////
////if let result = test(bundle: HomeBundle.c) as? ModelC {
////    print(result.nick)
////}
////
//if let result = test(bundle: HomeBundle2.init()) as? ModelC {
//    print(result.nick)
//}

let spec1 = BundleSpec.get(HomeBundle.a)
test2(spec: spec1)

let spec2 = BundleStruct(bundle: HomeBundle.a)
test3(spec: spec2)



