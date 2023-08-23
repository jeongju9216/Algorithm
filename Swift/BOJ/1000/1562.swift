//
//  1562.swift
//  Algorithm
//
//  Created by 유정주 on 2023/08/23.
//

import Foundation

let MOD = 1_000_000_000
let n = Int(readLine()!)!
let bitmask = 1 << 10
var dp: [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: 0, count: bitmask), count: 10), count: n + 1)

for i in 1..<10 {
    dp[1][i][1 << i] = 1
}

if n > 1 {
    for i in 2...n {
        for j in 0..<10 {
            let a = 1 << j
            for k in 1..<1024 {
                if j == 0 {
                    dp[i][j][k | a] += (dp[i-1][j+1][k] % MOD)
                } else if j == 9 {
                    dp[i][j][k | a] += (dp[i-1][j-1][k] % MOD)
                } else {
                    dp[i][j][k | a] += ((dp[i-1][j-1][k] % MOD) + (dp[i-1][j+1][k] % MOD))
                }
            }
        }
    }
}

print(dp[n].reduce(0) { $0 + $1[bitmask - 1] } % MOD)
