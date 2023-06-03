//
//  16926.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/09.
//

import Foundation

//Swift는 O(NMR)로 풀면 시간초과 발생함
let nmr = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = nmr[0], m = nmr[1], r = nmr[2]

var map: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    map.append(input)
}

let times = min(n, m) / 2
var nums: [[Int]] = []
for time in 0..<times {
    var arr: [Int] = []
    
    let nMax = n - time - 1
    let mMax = m - time - 1
    
    for i in time..<mMax {
        arr.append(map[time][i])
    }
    
    for i in time..<nMax {
        arr.append(map[i][mMax])
    }
    
    for i in (time+1...mMax).reversed() {
        arr.append(map[nMax][i])
    }
    
    for i in (time+1...nMax).reversed() {
        arr.append(map[i][time])
    }
    
    nums.append(arr)
}

for i in 0..<nums.count {
    let spinCount = r % nums[i].count
    for _ in 0..<spinCount {
        nums[i].append(nums[i].removeFirst())
    }
}

for time in 0..<times {
    let nMax = n - time - 1
    let mMax = m - time - 1
    var count = 0
    for i in time..<mMax {
        map[time][i] = nums[time][count]
        count += 1
    }
    
    for i in time..<nMax {
        map[i][mMax] = nums[time][count]
        count += 1
    }
    
    for i in (time+1...mMax).reversed() {
        map[nMax][i] = nums[time][count]
        count += 1
    }
    
    for i in (time+1...nMax).reversed() {
        map[i][time] = nums[time][count]
        count += 1
    }
}

for line in map {
    for num in line {
        print(num, terminator: " ")
    }
    print("")
}
