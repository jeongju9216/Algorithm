//
//  1967.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/05.
//

//1967 트리의 지름
import Foundation

typealias Node = (number: Int, cost: Int)

func dfs(_ node: Int, _ depth: Int) {
    visited[node] = true
    
    guard let tree = tree[node] else {
        return
    }
    
    if maxLength < depth {
        maxLength = depth
        maxNode = node
    }
    
    for node in tree {
        if !visited[node.number] {
            dfs(node.number, depth + node.cost)
        }
    }
}

let n = Int(readLine()!)!
var tree: [Int: [Node]] = [:]
for _ in 0..<n-1 {
    let input = readLine()!.split { $0 == " " }.map { Int($0)! }
    tree[input[0], default: []].append((input[1], input[2]))
    tree[input[1], default: []].append((input[0], input[2]))
}


var visited: [Bool] = Array(repeating: false, count: n + 1)
var maxNode = 0, maxLength = 0

dfs(1, 0)

visited = Array(repeating: false, count: n + 1)
maxLength = 0

dfs(maxNode, 0)

print(maxLength)
