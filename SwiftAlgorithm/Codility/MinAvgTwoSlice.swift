//
//  MinAvgTwoSlice.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/06/18.
//

import Foundation

public func solution(_ A : inout [Int]) -> Int {
    // write your code in Swift 4.2.1 (Linux)

    var minAvg = Double(A[0] + A[1]) / 2.0
    var result = 0
    for i in 2..<A.count {
        //3개짜리 평균
        let threeAvg = Double(A[i-2] + A[i-1] + A[i]) / 3.0
        if minAvg > threeAvg {
            minAvg = threeAvg
            result = i-2
        }

        //2개짜리 평균
        let twoAvg = Double(A[i-1] + A[i]) / 2.0
        if minAvg > twoAvg {
            minAvg = twoAvg
            result = i-1
        }
    }

    return result
}
