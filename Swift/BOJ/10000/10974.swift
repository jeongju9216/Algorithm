//
//  10974.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/10.
//

import Foundation

func backtracking(_ current: [Int]) {
    if current.count == input {
        for num in current {
            print(num, terminator: " ")
        }
        print("")
        return
    }
    
    for i in 1...input where !visited[i] {
        visited[i] = true
        backtracking(current + [i])
        visited[i] = false
    }
}

let input = Int(readLine()!)!
var visited: [Bool] = Array(repeating: false, count: input+1)

backtracking([])
