//
//  70.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/08/02.
//

import Foundation

class Solution {
    func climbStairs(_ n: Int) -> Int {
        var dp: [Int] = Array(repeating: 1, count: n+1)
        dp[1] = 1
        
        if n >= 2 {
            for i in 2...n {
                dp[i] = dp[i-1] + dp[i-2]
            }
        }
        
        return dp[n]
    }
}
