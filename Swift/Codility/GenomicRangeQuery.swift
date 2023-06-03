//
//  GenomicRangeQuery.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/06/18.
//

import Foundation
import Glibc

// you can write to stdout for debugging purposes, e.g.
// print("this is a debug message")

public func solution(_ S : inout String, _ P : inout [Int], _ Q : inout [Int]) -> [Int] {
    // write your code in Swift 4.2.1 (Linux)
    //ACGT -> 1234
    let DNADir: [String: Int] = ["A": 1, "C": 2, "G": 3, "T": 4]
    
    let pqTuples: [(p: Int, q: Int)] = (0..<P.count).map { (P[$0], Q[$0]) }
    let sArr: [Int] = S.map { DNADir[String($0)]! }

    let result: [Int] = pqTuples.map { Set(sArr[$0.p...$0.q]).min()! }
    
    return result
}
