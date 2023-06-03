//
//  2503.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/08.
//

import Foundation

let n = Int(readLine()!)!
var inputs: [Int: (strike: Int, ball: Int)] = [:]
for _ in 0..<n {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    inputs[input[0]] = (input[1], input[2])
}

var result = 0
for i in 1...9 {
    for j in 1...9 where j != i {
        for k in 1...9 where k != i && k != j {
            var canAnswer = true
            for (number, tuple) in inputs {
                let arr = String(number).map { Int(String($0))! }
                var strike = 0, ball = 0
                
                if arr[0] == i {
                    strike += 1
                } else if arr.contains(i) {
                    ball += 1
                }
                
                if arr[1] == j {
                    strike += 1
                } else if arr.contains(j) {
                    ball += 1
                }
                
                if arr[2] == k {
                    strike += 1
                } else if arr.contains(k) {
                    ball += 1
                }
                
                if tuple.strike != strike || tuple.ball != ball {
                    canAnswer = false
                    break
                }
            }
            
            if canAnswer {
                result += 1
            }
        }
    }
}

print(result)
