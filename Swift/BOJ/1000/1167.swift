//
//  1167.swift
//  Algorithm
//
//  Created by 유정주 on 2023/08/16.
//

import Foundation

func dfs(_ n: Int, _ sum: Int) {
    if maxLength < sum {
        maxNode = n
        maxLength = sum
    }
    
    for next in graph[n] ?? [] where !visited.contains(next.n) {
        visited.insert(next.n)
        dfs(next.n, sum + next.c)
    }
}

let v = Int(readLine()!)!
var graph: [Int: [(n: Int, c: Int)]] = [:]
for _ in 0..<v {
    let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    let vNum = arr[0]
    for i in stride(from: 1, to: arr.count-1, by: 2) {
        graph[vNum, default: []].append((arr[i], arr[i+1]))
    }
}

var maxNode = 0, maxLength = 0

var visited: Set<Int> = [1]
dfs(1, 0)

maxLength = 0
visited = [maxNode]
dfs(maxNode, 0)

print(maxLength)
