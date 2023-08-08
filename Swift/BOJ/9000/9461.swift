//
//  9461.swift
//  Algorithm
//
//  Created by 유정주 on 2023/08/07.
//

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    var dp: [Int] = [0, 1, 1, 1]
    
    if n < 4 {
        print(dp[n])
        continue
    }
    
    for i in 4...n {
        dp.append(dp[i-2] + dp[i-3])
    }
    
    print(dp[n])
}
