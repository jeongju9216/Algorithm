//
//  7490.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/10.
//

import Foundation

func backtracking(_ current: String, _ number: Int, _ n: Int, _ sign: Int, _ sum: Int) {
    if n == input {
        let sum = sum + (number * sign)
        if sum == 0 {
            print(current)
        }
        return
    }
    
    backtracking(current + " \(n+1)", number * 10 + (n + 1), n + 1, sign, sum)
    backtracking(current + "+\(n+1)", n + 1, n + 1, 1, sum + (sign * number))
    backtracking(current + "-\(n+1)", n + 1, n + 1, -1, sum + (sign * number))
}

let testcase = Int(readLine()!)!
var input = 0
for _ in 0..<testcase {
    input = Int(readLine()!)!
    
    backtracking("1", 1, 1, 1, 0)
    print("")
}
