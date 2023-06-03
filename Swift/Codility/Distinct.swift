//
//  Distinct.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/06/19.
//

import Foundation

// you can write to stdout for debugging purposes, e.g.
// print("this is a debug message")

public func solution(_ A : inout [Int]) -> Int {
    // write your code in Swift 4.2.1 (Linux)
    return Set(A).count
}
