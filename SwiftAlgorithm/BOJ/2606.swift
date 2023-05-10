//
//  2606.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/05.
//

//2606 바이러스
import Foundation

func dfs(_ node: Int) {
    for next in graph[node] ?? [] {
        if !visited[next] {
            result += 1
            visited[next] = true
            dfs(next)
        }
    }
}

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var graph: [Int: [Int]] = [:]
for _ in 0..<m {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    graph[input[0], default: []].append(input[1])
    graph[input[1], default: []].append(input[0])
}

var visited: [Bool] = Array(repeating: false, count: n + 1)

var result = 0
visited[1] = true
dfs(1)

print(result)
