//
//  1389.swift
//  Algorithm
//
//  Created by 유정주 on 2023/08/14.
//

import Foundation

func bfs(_ start: Int) -> Int {
    var result = 0
    
    var queue: [(Int, depth: Int)] = [(start, 0)]
    var index = 0
    
    while index < queue.count {
        let (node, depth) = queue[index]
        index += 1
        
        for next in graph[node] ?? [] where !visited[next] {
            visited[next] = true
            let nd = depth + 1
            result += nd
            queue.append((next, nd))
        }
    }
    
    return result
}

let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var graph: [Int: Set<Int>] = [:]
for _ in 0..<m {
    let ab = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    graph[ab[0], default: []].insert(ab[1])
    graph[ab[1], default: []].insert(ab[0])
}

var result = 0, minDepth = Int.max
var visited: [Bool] = []
for i in 1...n {
    visited = Array(repeating: false, count: n + 1)
    visited[i] = true
    
    let depth = bfs(i)
    if minDepth > depth {
        minDepth = depth
        result = i
    }
}

print(result)
