//
//  CountDiv.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/06/18.
//

import Foundation

public func solution(_ A : Int, _ B : Int, _ K : Int) -> Int {
    // write your code in Swift 4.2.1 (Linux)

    let minCount: Int = Int(floor(Double(A-1) / Double(K)))
    let maxCount: Int = Int(floor(Double(B) / Double(K)))

    // print("minCount: \(minCount) / maxCount: \(maxCount)")

    return maxCount - minCount
}
