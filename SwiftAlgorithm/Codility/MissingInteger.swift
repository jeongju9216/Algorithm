//
//  MissingInteger.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/06/18.
//

import Foundation

public func solution(_ A : inout [Int]) -> Int {
    // write your code in Swift 4.2.1 (Linux)

    if A.isEmpty || A.max()! <= 0 {
        return 1
    }

    let A = A.filter { $0 > 0 }.sorted() //O(N) + O(NlogN)

    var count = 1
    for num in A { //O(N)
        if num > count {
            break
        } else {
            count = num + 1
        }
    }

    return count
}
