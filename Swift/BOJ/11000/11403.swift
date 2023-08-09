//
//  11403.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/08/09.
//

import Foundation

func dfs(_ start: Int, _ node: Int) {
    for i in 0..<n {
        if !visited[i] && graph[node][i] == 1 {
            result[start][i] = 1
            visited[i] = true
            dfs(start, i)
        }
    }
}

let n = Int(readLine()!)!
var graph: [[Int]] = []
for _ in 0..<n {
    graph.append(readLine()!.split { $0 == " " }.map { Int(String($0))! })
}

var result: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
var visited: [Bool] = []
for i in 0..<n {
    visited = Array(repeating: false, count: n)
    dfs(i, i)
}

for line in result {
    line.forEach { print($0, terminator: " ") }
    print()
}
