//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/06/03.
//

import Foundation

let input = Int(readLine()!)!
var dp: [Int] = [0, 1]
if input > 1 {
    for i in 2...input {
        dp.append(dp[i-1] + dp[i-2])
    }
}

print(dp[input])

