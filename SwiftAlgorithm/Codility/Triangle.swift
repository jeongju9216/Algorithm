//
//  Triangle.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/06/19.
//

import Foundation

public func solution(_ A : inout [Int]) -> Int {
    // write your code in Swift 4.2.1 (Linux)
    guard A.count >= 3 else { return 0 }

    let sortedA = A.sorted()
    var isTriangular = false
    for i in 0..<sortedA.count-2 {
        //A[R] + A[P] > A[Q] 체크
        if Int64(sortedA[i] + sortedA[i+1]) > sortedA[i+2] {
            isTriangular = true
            break
        }
    }

    return isTriangular ? 1 : 0
}
