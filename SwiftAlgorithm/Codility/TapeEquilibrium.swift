//
//  TapeEquilibrium.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/06/18.
//

import Foundation

public func solution(_ A : inout [Int]) -> Int {
    // write your code in Swift 4.2.1 (Linux)
    var front = 0, back = A.reduce(0, +)
    
    var result = 0
    for (index, num) in A.enumerated() {
        front += num
        back -= num

        let diff = abs(front - back)
        if index == 0 {
            result = diff
        } else if index == A.count - 1 {
            break
        } else {
            result = min(result, diff)
        }
    }

    return result
}
