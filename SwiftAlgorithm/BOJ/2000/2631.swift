//
//  2631.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/10.
//

import Foundation

let n = Int(readLine()!)!
var input: [Int] = []
for _ in 0..<n {
    input.append(Int(readLine()!)!)
}

var dp: [Int] = Array(repeating: 0, count: n + 1)
dp[0] = 0

var maxLength = 0
for i in 1...n {
    dp[i] = 1
    for j in 1...i {
        if input[i-1] > input[j-1] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
    maxLength = max(maxLength, dp[i])
}

print(n - maxLength)
