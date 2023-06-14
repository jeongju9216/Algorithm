//
//  1003.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/14.
//

import Foundation

func fibonacci(_ num: Int) -> Int {
    if num == 0 {
        return 0
    } else if num == 1 {
        return 1
    }
    
    if dp[num] > 0 {
        return dp[num]
    } else {
        dp[num] = fibonacci(num-1) + fibonacci(num-2)
        return dp[num]
    }
}


let t = Int(readLine()!)!

var dp: [Int] = []

for _ in 0..<t {
    let n = Int(readLine()!)!
    dp = Array(repeating: 0, count: max(2, n + 1))
    dp[0] = 0
    dp[1] = 1
    
    let _ = fibonacci(n)
    
    if n == 0 {
        print("1 0")
    } else if n == 1 {
        print("0 1")
    } else {
        print("\(dp[n-1]) \(dp[n])")
    }
}
