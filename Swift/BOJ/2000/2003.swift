//
//  2003.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/09.
//

import Foundation

let nm = readLine()!.split { $0 == " " }.map { Int($0)! }
let n = nm[0], m = nm[1]
let nums = readLine()!.split { $0 == " " }.map { Int($0)! }

var left = 0, right = 1
var sum = nums[0]
var result = 0
while left <= right {
    if sum == m {
        result += 1
        sum -= nums[left]
        left += 1
    } else if sum < m {
        if right < n {
            sum += nums[right]
            right += 1
        } else {
            break
        }
    } else if sum > m {
        sum -= nums[left]
        left += 1
    }
}

print(result)
