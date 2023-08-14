//
//  11054.swift
//  Algorithm
//
//  Created by 유정주 on 2023/08/14.
//

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }

var dp1: [Int] = Array(repeating: 1, count: n)
var dp2: [Int] = Array(repeating: 1, count: n)

for i in 0..<n {
    for j in 0..<i {
        if arr[i] > arr[j] {
            dp1[i] = max(dp1[i], dp1[j] + 1)
        }
    }
}

for i in (0..<n).reversed() {
    for j in i..<n {
        if arr[i] > arr[j] {
            dp2[i] = max(dp2[i], dp2[j] + 1)
        }
    }
}

let result = (0..<n).map { dp1[$0] + dp2[$0] - 1 }.max()!
print(result)
