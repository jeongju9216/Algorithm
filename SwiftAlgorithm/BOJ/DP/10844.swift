//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/18.
//

//10844 쉬운 계단 수
import Foundation

let MOD = 1000000000

let input = Int(readLine()!)!
var dp: [[Int]] = Array(repeating: [], count: input+1)

dp[1].append(0)
for _ in 1...9 {
    dp[1].append(1)
}

if input >= 2 {
    for i in 2...input {
        for j in 0...9 {
            switch j {
            case 0:
                dp[i].append(dp[i-1][j+1] % MOD)
            case 9:
                dp[i].append(dp[i-1][j-1] % MOD)
            default:
                dp[i].append((dp[i-1][j-1] + dp[i-1][j+1]) % MOD)
            }
        }
    }
}

print(dp[input].reduce(0) { ($0 + $1) % MOD })
