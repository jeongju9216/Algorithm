//
//  PermMissingElem.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/06/17.
//

import Foundation


public func solution(_ A : inout [Int]) -> Int {
    // write your code in Swift 4.2.1 (Linux)
    let a = A.sorted()

    var count = 1
    for num in a {
        if count != num {
            break
        }

        count += 1
    }

    return count
}
