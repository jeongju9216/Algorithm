//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/08/23.
//

import Foundation

let MOD = 1_000_000_000
let n = Int(readLine()!)!

var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 10), count: n + 1)
for i in 1...9 {
    dp[1][i] = 1
}

if n > 1 {
    for i in 2...n {
        for j in 0...9 {
            if j == 0 {
                dp[i][j] = dp[i-1][j+1] % MOD
            } else if j == 9 {
                dp[i][j] = dp[i-1][j-1] % MOD
            } else {
                dp[i][j] = dp[i-1][j+1] % MOD + dp[i-1][j-1] % MOD
            }
        }
    }
}

print(dp[n].reduce(0) { ($0 + $1) % MOD })
