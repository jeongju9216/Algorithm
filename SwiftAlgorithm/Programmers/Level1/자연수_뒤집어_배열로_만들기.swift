//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/27.
//

import Foundation

func solution(_ n:Int64) -> [Int] {
    return String(n).reversed().compactMap { Int(String($0)) }
}
