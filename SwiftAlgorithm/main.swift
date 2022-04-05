//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/05.
//

//1967 트리의 지름
import Foundation

let count = Int(readLine()!)!

if count == 1 {
    print(0)
} else {
    var graph: [Int: [(n: Int, len: Int)]] = [:]
    for i in 1...count {
        graph.updateValue([], forKey: i)
    }
    
    for _ in 0..<(count-1) {
        let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
        graph[input[0]]!.append((input[1], input[2]))
        graph[input[1]]!.append((input[0], input[2]))
    }
    
    var visited: [Bool] = Array(repeating: false, count: count + 1)
    var maxNode = 0
    var maxLength = 0
    func dfs(_ node: Int, _ depth: Int) {
        visited[node] = true
        
        if maxLength < depth {
            maxLength = depth
            maxNode = node
        }
        
        for node in graph[node]! {
            if !visited[node.n] {
                dfs(node.n, depth + node.len)
            }
        }
    }
    
    dfs(1, 0)
    
    maxLength = 0
    visited = Array(repeating: false, count: count + 1)
    
    dfs(maxNode, 0)
    
    print(maxLength)
}
