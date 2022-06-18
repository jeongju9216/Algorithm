//
//  PermCheck.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/06/18.
//

import Foundation

public func solution(_ A : inout [Int]) -> Int {
    let setA = Set(A)
    
    return (setA.count == A.max() && setA.count == A.count) ? 1 : 0
}
