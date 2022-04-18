//: [Previous](@previous)

import Foundation


//정점의 갯수
var n = 5
//시작 정점
var start = 1
//연결된 정보
var connections = [[1,2,1],[1,3,19],[1,4,10],[1,5,3],[2,3,30],[2,4,2],[2,5,7],[3,4,26],[3,5,4],[4,5,1]]
//경로를 저장할 배열
var allRoutes = (0...n).map{[$0]}
//거리를 저장할 배열(초기 값은 Int의 최댓값으로 설정)
var allDistances = Array(repeating: Int.max, count: n+1)


//다익스트라로 시작 정점에서 가장 가까운 거리로 업데이트해줌.
func dijkstra() {
    //자기 자신과의 거리는 0
    allDistances[start] = 0
    //시작 인덱스를 담은 큐를 만들어줌.
    var queue:[Int] = [start]
    //큐가 모두 없어질때까지 반복
    while !queue.isEmpty {
        //큐의 가장 첫번째 값을 저장하면서 삭제해줌.
        let first = queue.removeFirst()
        //연결 정보에서 큐의 첫번째 값이 있는 것들로 필터링 해줌.
        let filterNodes = connections.filter{$0[0] == first || $0[1] == first}
        //필터링한 것들을 순회
        for node in filterNodes {
            //첫번째 값이 아닌 것을 other로 설정
            let connectionNode = node[0] == first ? node[1] : node[0]
            //만약 Int 최댓값이라면 continue
            if allDistances[first] == Int.max {continue}
            //첫번째 값에 거리를 더한 것이 원래 있는 값보다 작다면
            if allDistances[first]+node[2] < allDistances[connectionNode] {
                //첫번째 값에 거리를 더한 것으로 업데이트
                allDistances[connectionNode] = allDistances[first]+node[2]
                //첫번째 큐에 있는 루트를 저장함.
                var newRoute = allRoutes[first]
                //현재 노드를 추가해줌.
                newRoute.append(connectionNode)
                //현재 노드를 새로운 경로로 바꿔줌.
                allRoutes[connectionNode] = newRoute
                //현재 노드를 큐에 넣어줌.
                queue.append(connectionNode)
            }
        }
    }
}

dijkstra()
print(allDistances) //[9223372036854775807, 0, 1, 7, 3, 3]
print(allRoutes) //[[0], [1], [1, 2], [1, 5, 3], [1, 2, 4], [1, 5]]



//: [Next](@next)
