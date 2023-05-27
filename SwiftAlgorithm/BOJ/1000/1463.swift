//
//  1463.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/16.
//

//1463 1로 만들기
import Foundation

let n = Int(readLine()!)!

var dp: [Int] = Array(repeating: 0, count: n+1)
dp[1] = 0
if n > 1 {
    for i in 2...n {
        if i % 3 == 0 && i % 2 == 0 {
            dp[i] = min(dp[i/3], dp[i/2], dp[i-1]) + 1
        } else if i % 3 == 0 {
            dp[i] = min(dp[i/3], dp[i-1]) + 1
        } else if i % 2 == 0 {
            dp[i] = min(dp[i/2], dp[i-1]) + 1
        } else {
            dp[i] = dp[i-1] + 1
        }
    }
}

print(dp[n])
