//
//  2579.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/09.
//

import Foundation

let n = Int(readLine()!)!
var nums: [Int] = [0]
for _ in 0..<n {
    let input = Int(readLine()!)!
    nums.append(input)
}

var dp: [Int] = Array(repeating: 0, count: n + 1)
dp[1] = nums[1]
if n >= 2 {
    dp[2] = nums[1] + nums[2]
}

if n <= 2 {
    print(dp[n])
    exit(0)
}

for i in 3...n {
    dp[i] = max(dp[i-2] + nums[i], dp[i-3] + nums[i-1] + nums[i])
}

print(dp[n])
