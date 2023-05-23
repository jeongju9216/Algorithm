//
//  9084.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/23.
//

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    let coins = readLine()!.split { $0 == " " }.map { Int($0)! }
    let m = Int(readLine()!)!
    
    var dp: [Int] = Array(repeating: 0, count: m + 1)
    
    for coin in coins {
        guard coin <= m else { continue }
        
        dp[coin] += 1
        
        if coin + 1 <= m {
            for i in (coin+1)...m {
                dp[i] += dp[i - coin]
            }
        }
    }
    
    print(dp[m])
}
