//
//  1106.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/14.
//

import Foundation

let cn = readLine()!.components(separatedBy: " ").map { Int($0)! }
let (c, n) = (cn[0], cn[1])

var arr: [(cost: Int, customer: Int)] = []
for _ in 0..<n {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    arr.append((input[0], input[1]))
}

var result = 0
let maxCount = 100001
var dp: [Int] = Array(repeating: 0, count: maxCount)
for i in 1...maxCount {
    for item in arr {
        if i >= item.cost {
            dp[i] = max(dp[i], dp[i-item.cost] + item.customer)
        }
    }
    
    if dp[i] >= c {
        result = i
        break
    }
}

print(result)
