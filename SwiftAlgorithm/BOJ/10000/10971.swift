//
//  10971.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/03.
//

import Foundation

func dfs(_ sum: Int, _ count: Int, _ current: Int, _ target: Int) {
    if sum > result {
        return
    }
    
    if count == n && current == target {
        result = min(result, sum)
        return
    }
    
    for i in 0..<n where map[current][i] > 0 {
        if !visited[i] {
            visited[i] = true
            dfs(sum + map[current][i], count + 1, i, target)
            visited[i] = false
        }
    }
}

let n = Int(readLine()!)!
var map: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    map.append(input)
}

var result = Int.max
var visited: [Bool] = []

visited = Array(repeating: false, count: n)
dfs(0, 0, 0, 0)

print(result)
