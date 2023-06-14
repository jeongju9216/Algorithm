//
//  11726.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/06/14.
//

//11726 2×n 타일링
import Foundation

let n = Int(readLine()!)!

var dp: [Int] = [0, 1, 2]
if n <= 2 {
    print(dp[n])
    exit(0)
}

for i in 3...n {
    dp.append((dp[i-1] + dp[i-2]) % 10007)
}

print(dp[n])
