//
//  7490.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/08/11.
//

import Foundation

func solution(_ depth: Int, _ number: Int, _ sum: Int, _ sign: Int, _ result: String, _ target: Int) {
    if depth > target {
        return
    }
    
    let current = sum + (sign * number)
    if depth == target && current == 0 {
        print(result)
        return
    }
    
    let next = depth + 1
    solution(next, number * 10 + next, sum, sign, result + " \(next)", target)
    solution(next, next, sum + (sign * number), +1, result + "+\(next)", target)
    solution(next, next, sum + (sign * number), -1, result + "-\(next)", target)
}

let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    solution(1, 1, 0, 1, "1", n)
    print()
}
