//
//  3273.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/26.
//

import Foundation

let n = Int(readLine()!)!
var input = readLine()!.split { $0 == " " }.map { Int($0)! }
let x = Int(readLine()!)!

input.sort()

var result = 0
var left = 0, right = n-1
while left < right {
    let sum = input[left] + input[right]
    if sum == x {
        result += 1
        left += 1
    } else if sum < x {
        left += 1
    } else if sum > x {
        right -= 1
    }
}

print(result)
