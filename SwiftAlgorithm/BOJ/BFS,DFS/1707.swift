//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/28.
//

//1707 이분 그래프
import Foundation

let count = Int(readLine()!)!

for _ in 0..<count {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let nodeCount = input[0], edgeCount = input[1]
    
    var graph: [[Int]] = Array(repeating: [], count: nodeCount+1)
    var visited: [Bool] = Array(repeating: false, count: nodeCount+1)
    var color: [Bool] = Array(repeating: false, count: nodeCount+1)
    for _ in 0..<edgeCount {
        let edge = readLine()!.split(separator: " ").map { Int(String($0))! }
        graph[edge[0]].append(edge[1])
        graph[edge[1]].append(edge[0])
    }
    
    var result: Bool = true
    func dfs(_ depth: Int) {
        for node in graph[depth] {
            if visited[node] {
                if color[node] == color[depth] {
                    result = false
                    return
                }
            } else {
                visited[node] = true
                color[node] = !color[depth]
                dfs(node)
            }
        }
    }
    
    for i in 1...nodeCount {
        dfs(i)
        
        if !result {
            break
        }
    }
    
    print(result ? "YES" : "NO")
}
