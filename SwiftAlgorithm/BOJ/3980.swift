//
//  3980.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/10.
//

import Foundation

func backtracking(_ position: Int, _ sum: Int) {
    if position == 11 {
        result = max(result, sum)
        return
    }
    
    for i in 0..<11 where map[i][position] > 0 {
        if !visited[i] {
            visited[i] = true
            
            backtracking(position + 1, sum + map[i][position])
            
            visited[i] = false
        }
    }
}

let testcase = Int(readLine()!)!

var map: [[Int]] = []
var visited: [Bool] = []
var result = 0
for _ in 0..<testcase {
    map = []
    visited = Array(repeating: false, count: 11)
    result = 0
    
    for _ in 0..<11 {
        let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
        map.append(input)
    }
    
    backtracking(0, 0)
    
    print(result)
}
