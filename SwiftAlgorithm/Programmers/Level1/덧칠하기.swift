//
//  덧칠하기.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/13.
//

import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    guard m > 1 else {
        return section.count
    }
    
    var visited: [Bool] = Array(repeating: true, count: n + 1)
    for num in section {
        visited[num] = false
    }
    
    var result = 0
    var index = 1
    while index <= n {
        if !visited[index] {
            result += 1
            index += m
        } else {
            index += 1
        }
    }
    
    return result
}
