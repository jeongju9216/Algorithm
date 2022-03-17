//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/17.
//

//11727 2xn 타일링 2
import Foundation

let input = Int(readLine()!)!

var dp: [Int] = [0, 1, 3]
if input >= 3 {
    for i in 3...input {
        dp.append((dp[i-1] + dp[i-2] * 2) % 10007)
    }
}
print(dp[input])
