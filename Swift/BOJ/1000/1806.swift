//
//  1806.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/19.
//

import Foundation

let ns = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = ns[0], s = ns[1]

var input = readLine()!.components(separatedBy: " ").map { Int($0)! }

var left = 0, right = 0
var sum = 0
var result = Int.max
while left <= right {
    if sum >= s {
        result = min(result, right - left)
        sum -= input[left]
        left += 1
    } else {
        if right == n {
            break
        }
        sum += input[right]
        right += 1
    }
}

if result == Int.max {
    result = 0
}

print(result)
