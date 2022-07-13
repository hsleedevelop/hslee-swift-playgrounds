/*: # Swift 5 */

import UIKit

/*: #### SE-0192 Handling Future Enum Cases */
//```swift
enum ModernLang {
    case deno
    case rust
    case swift
}

func printModernLang(moderLang: ModernLang) {
    switch moderLang {
        case .deno:
            print("hello, Deno!")
        case .rust:
            print("hello, rust!")
        @unknown default: /*: @unkown은 워닝을 발생함. */
            print("Hello, everyOne?")
    }
}
//```
    
//- SE-0200 Enhancing String Literals Delimiters to Support Raw Text
//    ```swift
    let hello = #"Hello! "Swift""#
    print(#" Swift is "Modern Lang!", \#(hello) "#)
    
    let str = ##"My dog said "woof"#gooddog"##

    let answer = 42
    let multiline = #"""
    The answer to life,
    the universe,
    and everything is \#(answer).
    """#

    let regex1 = "\\\\[A-Z]+[A-Za-z]+\\.[a-z]+"
    let regex2 = #"\\[A-Z]+[A-Za-z]+\.[a-z]+"#

//    ```
    
///- SE-0215 Conform Never to Equatable and Hashable
///   https://nshipster.co.kr/never/
//    Never 타입이 Equatable and Hashable 을 준수
//    * 열거형 Never 이란?
//  ```swift
    func crashAndBurn() -> Never {
        fatalError("Something very, very bad happened")
    }
//    ```
    

//- SE-0216 Introduce user-defined dynamically "callable" types


//- SE-0218 Introduce compactMapValues to Dictionary
//    ```swift
    times.compactMapValues { Int($0) }
//    ```
    
//- SE-0220 count(where:)
//    ```swift
    let scores = [100, 80, 85]
    let passCount = scores.count { $0 >= 85 }
//    ```
    

//- SE-0221. Character Properties
//    ```swift
//    Unicode에 기반한 Character들의 여러가지 속성들 추가를 제안하였고, Swift5에서 구현이 되었습니다.
//    ```
//    [https://jercy.tistory.com/10](https://jercy.tistory.com/10)
    

//- SE-0224 Support 'less than' operator in compilation conditions
//    ```swift
    // Swift < 5.0
    #if !compiler(>=4.2)
    // This will only be executed if the Swift compiler version is less than 4.2.
    #endif
    
    // Swift >= 5.0
    #if compiler(<4.2)
    // This will only be executed if the Swift compiler version is less than 4.2.
    #endif
//    ```
    

//- SE-0225 Adding isMultiple to BinaryInteger
//    ```swift
    // Swift < 5.0
    cell.contentView.backgroundColor = indexPath.row % 2 == 0 ? .gray : .white
    
    // Swift >= 5.0
    cell.contentView.backgroundColor = indexPath.row.isEven ? .gray : .white
    
    isEven, isOdd
//    ```
    

//- SE-0230 Flatten nested optionals resulting from 'try?'
//    ```swift

    // Swift 4: 'Int??'
    
    // Swift 5: 'Int?'
    
    let result = try? database?.countOfRows(matching: predicate)
    
    // Swift 4: 'String??'
    
    // Swift 5: 'String?'
    
    let myString = try? String(data: someData, encoding: .utf8)
    
    // Swift 4: '[String: Any]??'
    
    // Swift 5: '[String: Any]?'
    
    let dict = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
    
//    출처: https://zeddios.tistory.com/650 [ZeddiOS]
//    ```
    
//- SE-0234 Remove Sequence.SubSequence
    
//    ```swift
//    Sequence에서 SubSequence associated type을 제거하고, Collection에서부터 나타나도록 수정했다고 합니다.
//    그니까 원래는 Sequence에서 SubSequence associated type이였다면
//    이제는 Collection에서의 associated type이 SubSequence가 됩니다.
//    ```
    
//- SE-0235 Add Result to the Standard Library
//     Result Generic 타입 추가
*/
