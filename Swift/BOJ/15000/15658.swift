//
//  15658.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/10.
//

import Foundation

func backtracking(_ index: Int, _ current: Int) {
    if index == n {
        results[0] = max(results[0], current)
        results[1] = min(results[1], current)
        return
    }
    
    for i in 0..<4 where ops[i] > 0 {
        ops[i] -= 1
        
        let num = nums[index]
        //더하기 빼기 곱하기 나누기
        var resultOp = 0
        switch i {
        case 0: resultOp = current + num
        case 1: resultOp = current - num
        case 2: resultOp = current * num
        case 3: resultOp = current / num
        default: break
        }
        
        backtracking(index + 1, resultOp)
        
        ops[i] += 1
    }
}


let n = Int(readLine()!)!
let nums = readLine()!.components(separatedBy: " ").map { Int($0)! }
var ops = readLine()!.components(separatedBy: " ").map { Int($0)! }

var results = [Int.min, Int.max]

backtracking(1, nums[0])

print("\(results[0])")
print("\(results[1])")
