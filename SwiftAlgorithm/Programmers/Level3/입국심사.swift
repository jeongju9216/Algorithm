import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var left: Int64 = Int64(times.min()!), right: Int64 = Int64(n * times.min()!)
    var mid: Int64 = (left + right) / 2
    var result: Int64 = Int64.max
    while left < right {
        mid = (left + right) / 2
        
        var count: Int64 = 0
        for i in 0..<times.count {
            count += mid / Int64(times[i])
            
            if count > n {
                break
            }
        }
        
//         print("count: \(count) / left: \(left) / right: \(right) / mid: \(mid)")
        if count >= n {
            right = mid
            result = min(result, mid)
        } else if count < n {
            left = mid + 1
        }
    }
    
    return result
}

let n = 6
let times = [7, 10]
print(solution(n, times))
//k분이 주어졌을 때 n명의 사람이 심사를 모두 받을 수 있는가?
