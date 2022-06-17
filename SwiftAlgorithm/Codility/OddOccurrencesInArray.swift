//
//  OddOccurrencesInArray.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/06/17.
//

import Foundation

public func solution(_ A : inout [Int]) -> Int {
    var dict: [Int: Int] = [:]
    for num in A {
        dict[num] = (dict[num] ?? 0) + 1
    }

    let result = dict.keys.filter { dict[Int($0)]! % 2 != 0 }.first!
    return result
}
