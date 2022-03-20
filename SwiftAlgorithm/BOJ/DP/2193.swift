//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/20.
//

//2193 이친수
import Foundation

let input = Int(readLine()!)!

var dp: [Int] = [0, 1]
if input >= 2 {
    for _ in 2...input {
        let temp = dp[0]
        dp[0] = dp[0] + dp[1]
        dp[1] = temp
    }
}

print(dp[0] + dp[1])
