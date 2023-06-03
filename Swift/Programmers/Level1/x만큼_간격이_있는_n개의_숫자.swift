//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/27.
//

import Foundation

func solution(_ x:Int, _ n:Int) -> [Int64] {
    return (1...n).map { Int64(x) * Int64($0) }
}
