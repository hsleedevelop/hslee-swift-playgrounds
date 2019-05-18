//: [Previous](@previous)

import Foundation

//드문 경우지만, 다른 장소의 사진은 시간대 차이로 인해 시간과 날짜를 공유할 수 있다.
//
//우선 그는 도시별로 사진을 그룹화하기로 결심하고, 그런 다음 각 그룹 내에서 사진을 찍은 시간별로 분류하고,
// 마지막으로 사진에 연속적인 자연 번호를 부여한다. 1부터 시작한다.
//
//그 후에 그는 모든 사진의 이름을 바꾸려고 한다.
//
//각각의 사진의 새로운 이름은 도시의 이름과 그 사진에 이미 할당된 번호로 시작해야 한다.
//
//각 그룹의 모든 사진 수는 길이가 같아야 한다(이 그룹에서 가장 큰 숫자의 길이에 해당).
//따라서 존은 숫자에 몇 개의 선행 0을 추가해야 한다.
//
//사진의 새로운 이름은 그 연장선상에서 끝나야 하는데, 그것은 그대로여야 한다.
//
//사진의 이름, 파일명을 각각 제공하다.
//
//사진의 이름이 독특하지 않을 수도 있다는 것을 알고 있다.

public func solution(_ S : inout String) -> String {
    let photos = S.components(separatedBy: CharacterSet.newlines)

    var cities: [(String, String, Date)] = []
    var cityTable: [String: [(String, String, Date)]] = [:]

    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    
    let formatter = NumberFormatter()
    
    photos.forEach { photo in
        let parted = photo.components(separatedBy: ",").map { $0.trimmingCharacters(in: CharacterSet.whitespaces) }
        let city = parted[1]
        let ext = parted[0].components(separatedBy: ".").last ?? ""
        let date = dateFormatter.date(from: parted[2]) ?? Date()

        cities.append((city, ext, date))
    }
    
    var result = ""
    for city in cities {
        let name = city.0
        
        if cityTable[city.0] == nil {
            let sortedCity = cities.filter { $0.0 == city.0 }.sorted { lhs, rhs -> Bool in
                return lhs.2 < rhs.2
            }
            cityTable[city.0] = sortedCity
        }
        
        let count = "\(cityTable[city.0]?.count ?? 0)".count
        formatter.minimumIntegerDigits = count
        
        let index = cityTable[city.0]?.firstIndex { $0.2 == city.2 } ?? 0
        let fmtIndex = formatter.string(from: NSNumber(value: index + 1)) ?? ""
        //let filename = String(format: "%@%0\(count)d.%@\n", city.0, index+1, city.1)
        let filename = "\(city.0)\(fmtIndex).\(city.1)\n"
        result += filename
    }
    
    return result
}

var input = "photo.jpg, Warsaw, 2013-09-05 14:08:15\njohn.png, London, 2015-06-20 15:13:22\nmyFriends.png, Warsaw, 2013-09-05 14:07:13\nEiffel.jpg, Paris, 2015-07-23 08:03:02\npisatower.jpg, Paris, 2015-07-22 23:59:59\nBOB.jpg, London, 2015-08-05 00:02:03\nnotredame.png, Paris, 2015-09-01 12:00:00\nme.jpg, Warsaw, 2013-09-06 15:40:22\na.png, Warsaw, 2016-02-13 13:33:50\nb.jpg, Warsaw, 2016-01-02 15:12:22\nc.jpg, Warsaw, 2016-01-02 14:34:30\nd.jpg, Warsaw, 2016-01-02 15:15:01\ne.png, Warsaw, 2016-01-02 09:49:09\nf.png, Warsaw, 2016-01-02 10:55:32\ng.jpg, Warsaw, 2016-02-29 22:13:11"

let result = solution(&input)
print(result)
//20130905140815
