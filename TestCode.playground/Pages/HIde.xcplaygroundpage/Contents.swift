import Foundation

func solution(_ clothes:[[String]]) -> Int {
    
    var hash = [String: [String]]()
    for clo in clothes {
        print("clo=\(clo)")
        var value = clo[0]
        var key = clo[1]
        
        if var array = hash[key] {
            array.append(value)
            hash[key] = array
        } else {
            hash[key] = [value]
        }
    }
    
    print("hash=\(hash)")
    var result2 = hash.reduce(1) {
        $0 * ($1.value.count + 1)
    } - 1
    
    return result2
}

//let result = solution([["crow_mask", "face"], ["blue_sunglasses", "face"], ["smoky_makeup", "face"]])
let result = solution([["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]])
//let result = solution([["yellow_hat", "aa"], ["blue_sunglasses", "aa"], ["green_turban", "bb"], ["green_turban2", "bb"], ["green_turban4", "cc"], ["green_turban3", "cc"]])
print(result)


