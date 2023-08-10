//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/08/10.
//

import Foundation

func dfs(_ node: Int) {
    for next in graph[node] ?? [] {
        if result[next] < 0 {
            result[next] = node
            dfs(next)
        }
    }
}

let n = Int(readLine()!)!
var graph: [Int: [Int]] = [:]
for _ in 0..<n-1 {
    let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    graph[arr[0], default: []].append(arr[1])
    graph[arr[1], default: []].append(arr[0])
}

var result: [Int] = Array(repeating: -1, count: n + 1)
dfs(1)
print(result[2...].map { String($0) }.joined(separator: "\n"))

