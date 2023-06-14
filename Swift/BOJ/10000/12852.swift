//
//  12852.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/14.
//

import Foundation

var n = Int(readLine()!)!

var dp: [(cnt: Int, prev: Int)] = Array(repeating: (0, 0), count: n + 1)
dp[0] = (-1, 0)

for i in 1...n {
    dp[i] = (dp[i-1].cnt + 1, i-1)
    
    if i % 3 == 0 && dp[i/3].cnt + 1 < dp[i].cnt {
        dp[i] = (dp[i/3].cnt + 1, i / 3)
    }
    
    if i % 2 == 0 && dp[i/2].cnt + 1 < dp[i].cnt {
        dp[i] = (dp[i/2].cnt + 1, i / 2)
    }
}

print(dp[n].cnt)
while n >= 1 {
    print(n, terminator: " ")
    n = dp[n].prev
}
