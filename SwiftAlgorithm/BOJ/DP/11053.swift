//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/23.
//

//11053 가장 긴 증가하는 부분 수열
import Foundation

let input = Int(readLine()!)!
let numbers: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }

var dp: [Int] = Array(repeating: 1, count: input)
for i in 0..<input {
    for j in 0..<i {
        if numbers[i] > numbers[j] && dp[i] < dp[j]+1 {
            dp[i] = dp[j] + 1
        }
    }
}

print(dp.max()!)
