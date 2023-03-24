//
//  14501.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/24.
//

import Foundation

let n = Int(readLine()!)!
var table: [(time: Int, pay: Int)] = []
for _ in 0..<n {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    table.append((input[0], input[1]))
}

var dp: [Int] = Array(repeating: 0, count: table.count + 1)

for i in stride(from: n-1, through: 0, by: -1) {
    let item = table[i]
    let nextWorkDay = item.time + i
    if nextWorkDay > n {
        dp[i] = dp[i+1]
    } else {
        dp[i] = max(item.pay + dp[nextWorkDay], dp[i+1])
    }
}

print(dp[0])
