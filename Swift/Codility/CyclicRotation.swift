//
//  CyclicRotaion.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/06/17.
//

import Foundation

public func solution(_ A : inout [Int], _ K : Int) -> [Int] {
    var a = A
    if a.count <= 1 || (a.min() == a.max()) { //비어있거나 모두 차있으면 return a
        return a
    }

    (0..<K).forEach { _ in
        let last = a.popLast()!
        a = a.reversed()
        a.append(last)
        a = a.reversed()
    }

    return a
}
