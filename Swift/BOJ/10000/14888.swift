//
//  14888.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/18.
//

import Foundation

func backtracking(_ current: [Int], _ ops: [Int], _ total: Int) {
    if current.count == total {
        opSet.insert(current)
        return
    }
    
    var ops = ops
    for i in 0..<ops.count {
        if ops[i] > 0 {
            ops[i] -= 1
            backtracking(current + [i], ops, total)
            ops[i] += 1
        }
    }
}

let count = Int(readLine()!)!
let nums = readLine()!.components(separatedBy: " ").map { Int($0)! }
//더하기, 빼기, 곱하기, 나누기
let ops = readLine()!.components(separatedBy: " ").map { Int($0)! }
let total = ops.reduce(0, +)

var opSet: Set<[Int]> = []
backtracking([], ops, total)

var minResult = Int.max, maxResult = Int.min
for ops in opSet {
    var cur = 0
    var number = nums[cur]
    
    for op in ops {
        cur += 1
        
        switch op {
        case 0:
            number += nums[cur]
        case 1:
            number -= nums[cur]
        case 2:
            number *= nums[cur]
        case 3:
            number /= nums[cur]
        default: break
        }
    }

    maxResult = max(maxResult, number)
    minResult = min(minResult, number)
}

print(maxResult)
print(minResult)
