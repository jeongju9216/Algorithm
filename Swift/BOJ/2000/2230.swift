//
//  2230.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/08.
//

import Foundation

let nm = readLine()!.split { $0 == " " }.map { Int($0)! }
let n = nm[0], m = nm[1]
var nums: [Int] = []
for _ in 0..<n {
    let input = Int(readLine()!)!
    nums.append(input)
}

nums.sort()

var left = 0, right = 1
var result = Int.max
while left <= right && right < n {
    let sub = nums[right] - nums[left]
    if sub == m {
        result = sub
        break
    } else if sub > m {
        result = min(result, sub)
        left += 1
    } else if sub < m {
        right += 1
    }
}

print(result)
