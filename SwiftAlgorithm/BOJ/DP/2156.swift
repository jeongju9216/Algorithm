//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/22.
//

//2156 포도주 시식
import Foundation

let input = Int(readLine()!)!
var wines: [Int] = []
for _ in 0..<input {
    let wine = Int(readLine()!)!
    wines.append(wine)
}

var dp: [Int] = [0, wines[0]]
if input >= 2 {
    dp.append(dp[1] + wines[1])
}

if input >= 3 {
    for i in 3...input {
        var maxInput = max(dp[i-1], dp[i-2] + wines[i-1])
        maxInput = max(maxInput, dp[i-3] + wines[i-2] + wines[i-1])
        dp.append(maxInput)
    }
}

print(dp[input])
