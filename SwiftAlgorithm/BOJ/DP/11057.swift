//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/19.
//

//11057 오르막 수
import Foundation

let MOD = 10007
let input = Int(readLine()!)!

var dp: [Int] = Array(repeating: 1, count: 10)

for _ in 1..<input {
    for j in 1...9 {
        dp[j] = (dp[j-1] + dp[j]) % MOD
    }
}

print(dp.reduce(0, { ($0 + $1) % MOD }))
