//
//  FrogRiverOne.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/06/18.
//

import Foundation

public func solution(_ X : Int, _ A : inout [Int]) -> Int {
    // write your code in Swift 4.2.1 (Linux)
    guard !A.isEmpty else { return -1 } //비어있는 배열은 존재할 수 없다.
    guard A.count >= X else { return -1 } //A의 개수가 X보다 작다면 절대 건너지 못한다.

    var leaves: Set<Int> = []
    var result = -1
    for (i, num) in A.enumerated() {
        leaves.insert(num)
        if leaves.count == X {
            result = i //index가 초임
            break
        }
    }

    return result
}
