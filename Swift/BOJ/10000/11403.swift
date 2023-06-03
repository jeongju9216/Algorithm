//
//  11403.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/18.
//

import Foundation

func dfs(_ start: Int, _ node: Int) {
    for i in 0..<n where !visited[i] {
        if map[node][i] {
            result[start][i] = 1
            visited[i] = true
            dfs(start, i)
        }
    }
}

let n = Int(readLine()!)!

var map: [[Bool]] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { $0 == "1" ? true : false }
    map.append(input)
}

var result: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)

var visited: [Bool] = []

for i in 0..<n {
    visited = Array(repeating: false, count: n)
    dfs(i, i)
}

for line in result {
    line.forEach { print($0, terminator: " ") }
    print("")
}
