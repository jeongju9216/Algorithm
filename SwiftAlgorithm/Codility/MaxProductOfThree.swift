//
//  MaxProductOfThree.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/06/19.
//

import Foundation

public func solution(_ A : inout [Int]) -> Int {
    //non-empty array
    //swift sort = O(N log N)

    let sortedA = A.sorted()
    let countA = A.count

    let backProduct = sortedA[countA-1] * sortedA[countA-2] * sortedA[countA-3]

    var frontProduct = sortedA[0] * sortedA[1]
    if frontProduct < 0 {
        return backProduct
    } else {
        frontProduct *= sortedA[countA-1]
        return max(frontProduct, backProduct)
    }
}
