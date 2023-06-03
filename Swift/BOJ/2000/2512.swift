//
//  2512.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/10.
//

import Foundation

let n = Int(readLine()!)!
let input = readLine()!.components(separatedBy: " ").map { Int($0)! }.sorted()
let m = Int(readLine()!)!

var left = 0, right = input.last!
while left <= right {
    let mid = (left + right) / 2
    
    var sum = 0
    for i in 0..<n {
        if input[i] > mid {
            sum += mid
        } else {
            sum += input[i]
        }
    }
    
    if sum <= m {
        left = mid + 1
    } else {
        right = mid - 1
    }
}

print(right)
