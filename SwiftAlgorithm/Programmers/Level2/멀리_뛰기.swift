//
//  멀리_뛰기.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/05/05.
//

import Foundation

func solution(_ n:Int) -> Int {
    var dp: [Int] = [0, 1, 2]
    guard n >= 3 else { return dp[n] }
    
    for i in 3...n {
        dp.append((dp[i-1] + dp[i-2]) % 1234567)
    }
    
    return dp.last! % 1234567
}
