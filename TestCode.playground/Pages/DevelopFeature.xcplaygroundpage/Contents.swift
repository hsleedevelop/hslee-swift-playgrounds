import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    
    var prog: [(Int, Int)] = []
    var result = [Int]()
    for i in 0..<progresses.count {
        prog.append((progresses[i], speeds[i]))
    }
    
    print(prog)
    var date = 0
    var releaseCount = 0
    repeat {
//        for var job in prog {
//            job.0 += job.1
//            if job.0 >= 100 {
//                releaseCount += 1
//                let index = prog.firstIndex(where: { $0 == job }) ?? 0
//                print("index=\(index)")
//                prog.remove(at: index)
//            }
//        }
        var canRelease = false
        for i in 0..<prog.count {
            if prog[i].0 >= 100 { continue }
            prog[i].0 += prog[i].1
            if prog[i].0 >= 100 {
                releaseCount += 1

                canRelease = i > 0 ? prog[i-1].0 >= 100 : i == 0
                
                print("releaseCount=\(releaseCount), canRelease=\(canRelease)")
            }
        }
        
        if releaseCount > 0, canRelease {
            result.append(releaseCount)
            releaseCount = 0
        }
        
        //prog.removeFirst()
        date += 1
        print(date, prog)
    } while prog.contains(where: { $0.0 < 100 })
    
    return result
}


func solution2(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    
    var prog: [(Int, Int)] = []
    var result = [Int]()
    for i in 0..<progresses.count {
        prog.append((progresses[i], speeds[i]))
    }
    
    var date = 0
    var releaseCount = 0
    repeat {
        var canRelease = false
        for i in 0..<prog.count {
            if prog[i].0 >= 100 { continue }
            prog[i].0 += prog[i].1
            if prog[i].0 >= 100 {
                releaseCount += 1
                canRelease = i > 0 ? prog[i-1].0 >= 100 : i == 0
            }
        }
        
        if releaseCount > 0, canRelease {
            result.append(releaseCount)
            releaseCount = 0
        }
        
        date += 1
    } while prog.contains(where: { $0.0 < 100 })
    
    return result
}

//let result = solution([93,30,55], [1,30,5])
let result = solution([99,30,55,90], [1,30,5,2])
print(result)
