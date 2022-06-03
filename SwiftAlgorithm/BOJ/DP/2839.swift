//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/06/03.
//

import Foundation

let input = Int(readLine()!)!

var dp: [Int] = Array(repeating: -1, count: input+1)

for i in 3...input {
    var counts: [Int] = []
    
    if i % 5 == 0 {
        dp[i] = i / 5
        continue
    } else {
        if i % 3 == 0 {
            counts.append(i / 3)
        }
        
        if i-3 >= 0 && dp[i-3] > 0 {
            counts.append(dp[i-3] + 1)
        }
        
        if i-5 >= 0 && dp[i-5] > 0 {
            counts.append(dp[i-5] + 1)
        }
    }
    
    dp[i] = counts.min() ?? -1
}

print(dp[input])
