//
//  21921.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/29.
//

import Foundation

let nx = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = nx[0], x = nx[1]
let input = readLine()!.components(separatedBy: " ").map { Int($0)! }

var left = 0, right = x - 1
var sum = input[left...right].reduce(0, +)
var maxCount = sum, rangeCount = 1
while right + 1 < n {
    sum -= input[left]
    left += 1
    
    right += 1
    sum += input[right]
    
    if maxCount == sum {
        rangeCount += 1
    } else if maxCount < sum {
        maxCount = sum
        rangeCount = 1
    }
}

if maxCount == 0 {
    print("SAD")
} else {
    print(maxCount)
    print(rangeCount)
}
