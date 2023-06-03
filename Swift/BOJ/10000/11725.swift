//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/05/29.
//

import Foundation

let nodeCount: Int = Int(readLine()!)!

var graph: [Int: [Int]] = [:]
for _ in 0..<nodeCount-1 {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    if let _ = graph[input[0]] {
        graph[input[0]]?.append(input[1])
    } else {
        graph[input[0]] = [input[1]]
    }
    
    if let _ = graph[input[1]] {
        graph[input[1]]?.append(input[0])
    } else {
        graph[input[1]] = [input[0]]
    }
}

var stack: [Int] = [1]
var visited: [Int] = Array(repeating: 0, count: nodeCount+1)
visited[1] = 1

while !stack.isEmpty {
    let node = stack.popLast()!
    
    for next in graph[node] ?? [] {
        if visited[next] <= 0 {
            visited[next] = node
            stack.append(next)
        }
    }
}

for node in visited[2...nodeCount] {
    print(node)
}
