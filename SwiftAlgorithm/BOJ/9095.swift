//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/18.
//

//9095 1, 2, 3 더하기
import Foundation

let count = Int(readLine()!)!
for _ in 0..<count {
    let input = Int(readLine()!)!
    var dp: [Int] = [0, 1, 2, 4]
    if input >= 4 {
        for i in 4...input {
            dp.append(dp[i-1] + dp[i-2] + dp[i-3])
        }
    }
    print(dp[input])
}
