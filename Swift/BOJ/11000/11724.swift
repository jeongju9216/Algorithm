//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/08/10.
//

import Foundation

let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nm[0], m = nm[1]

var graph: [Int: [Int]] = [:]
for _ in 0..<m {
    let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    graph[arr[0], default: []].append(arr[1])
    graph[arr[1], default: []].append(arr[0])
}

var visited: [Bool] = Array(repeating: false, count: n + 1)
var result = 0
for i in 1...n where !visited[i] {
    result += 1
    visited[i] = true
    
    var stack: [Int] = [i]
    while !stack.isEmpty {
        let node = stack.removeLast()
        
        for next in graph[node] ?? [] where !visited[next] {
            visited[next] = true
            stack.append(next)
        }
    }
}

print(result)
