//: [Previous](@previous)

import Foundation

///
//문제 설명
//스트리밍 사이트에서 장르 별로 가장 많이 재생된 노래를 두 개씩 모아 베스트 앨범을 출시하려 합니다. 노래는 고유 번호로 구분하며, 노래를 수록하는 기준은 다음과 같습니다.
//
//속한 노래가 많이 재생된 장르를 먼저 수록합니다.
//장르 내에서 많이 재생된 노래를 먼저 수록합니다.
//장르 내에서 재생 횟수가 같은 노래 중에서는 고유 번호가 낮은 노래를 먼저 수록합니다.
//노래의 장르를 나타내는 문자열 배열 genres와 노래별 재생 횟수를 나타내는 정수 배열 plays가 주어질 때, 베스트 앨범에 들어갈 노래의 고유 번호를 순서대로 return 하도록 solution 함수를 완성하세요.
//
//제한사항
//genres[i]는 고유번호가 i인 노래의 장르입니다.
//plays[i]는 고유번호가 i인 노래가 재생된 횟수입니다.
//genres와 plays의 길이는 같으며, 이는 1 이상 10,000 이하입니다.
//장르 종류는 100개 미만입니다.
//장르에 속한 곡이 하나라면, 하나의 곡만 선택합니다.
//모든 장르는 재생된 횟수가 다릅니다.
///

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    typealias Album = (index: Int, play: Int)
    var playlist = [String: (total: Int, first: Album, second: Album?)]()
    
    for i in 0..<genres.count {
        let genre = genres[i]
        let played = plays[i]
        
        if let _ = playlist[genre] {
            playlist[genre]!.total += played
            
            let first = playlist[genre]!.first
            let new =  Album(i, played)
            if first.play < new.play {
                playlist[genre]!.second = first
                playlist[genre]!.first = new
            } else {
                if let _ = playlist[genre]!.second {
                    if playlist[genre]!.second!.play < played {
                        playlist[genre]!.second = new
                    }
                } else {
                    playlist[genre]!.second = new
                }
            }
        } else {//init
            playlist[genre] = (played, (i, played), nil)
        }
    }
    
//    var splaylist = playlist.sorted { left, right -> Bool in
//        return left.value.total > right.value.total
//    }

    var result = [Int]()

    
    playlist
        .sorted { left, right -> Bool in
            return left.value.total > right.value.total
        }
        .forEach { album in
            result.append(album.value.first.index)
            if let _ = album.value.second {
                result.append(album.value.second!.index)
            }
    }

//    print (playlist)
//    print (max)
//    print (maxKey)
    return result
}

let result = solution(["classic", "pop", "classic", "classic", "pop"], [500, 600, 150, 800, 2500])//    [4, 1, 3, 0])
print(result)
