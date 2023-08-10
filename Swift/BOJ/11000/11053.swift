//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/08/10.
//

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }

var dp: [Int] = Array(repeating: 1, count: n + 1)
for i in 0..<n {
    for j in 0..<i {
        if arr[i] > arr[j] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

print(dp.max()!)
