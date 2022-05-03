//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/05/03.
//

import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    let result: [Int] = (Int(left)...Int(right)).map {
        max($0 / n + 1, $0 % n + 1)
    }
    // print("result: \(result)")
    
    return result
}
