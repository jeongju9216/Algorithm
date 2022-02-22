//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/22.
//

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var result = 0
    
    result = (0..<a.count).map {
        a[$0] * b[$0]
    }.reduce(0, +)
    
    return result
}

let a = [-1,0,1]
let b = [1,0,-1]
print(solution(a, b))
