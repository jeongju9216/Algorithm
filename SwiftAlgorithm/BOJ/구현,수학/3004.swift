//
//  main.swift
//  Algorithm
//
//  Created by 유정주 on 2021/09/07.
//
//3004 체스판 조각
//import Foundation
let input = Int(readLine()!)!
//dp로 해결
var dp = [0, 2]
for i in 2 ... input + 1 {
    dp.append(dp[i-1] + (i/2 + 1))
}
print(dp[input])
//수학으로 푼 코드
//print((input/2 + 1) * (input - input/2 + 1))
