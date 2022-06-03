//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/06/03.
//

import Foundation

//nCr : n개 중에서 r개를 뽑는 개수
func combi(n: Int, r: Int) -> Int {
    guard dp[n][r] == 0  else {
        return dp[n][r]
    }
    
    if n == r || r == 0 {
        dp[n][r] = 1
    } else {
        dp[n][r] = combi(n: n-1, r: r-1) + combi(n: n-1, r: r)
    }
    
    return dp[n][r]
}

let testCount = Int(readLine()!)!

var dp: [[Int]] = []
for _ in 0..<testCount {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    
    let west = input[0], east = input[1]
    
    dp = Array(repeating: Array(repeating: 0, count: 30), count: 30)
    combi(n: east, r: west)
    print(dp[east][west])
}
