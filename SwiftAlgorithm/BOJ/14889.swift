//
//  14889.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/10.
//

import Foundation

func backtracking(_ depth: Int, _ start: Int) {
    //절반을 뽑는다
    if depth == n / 2 {
        var team1 = 0, team2 = 0
        for i in 0..<n {
            for j in 0..<n {
                if visited[i] && visited[j] {
                    team1 += map[i][j]
                } else if !visited[i] && !visited[j] {
                    team2 += map[i][j]
                }
            }
        }
        
        result = min(result, abs(team1 - team2))
        
        return
    }
    
    for i in start..<n where !visited[i] {
        visited[i] = true
        backtracking(depth + 1, i)
        visited[i] = false
    }
}

let n = Int(readLine()!)!
var map: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int($0)! }
    map.append(input)
}

var visited: [Bool] = Array(repeating: false, count: n)
var result = Int.max

backtracking(0, 0)

print(result)
