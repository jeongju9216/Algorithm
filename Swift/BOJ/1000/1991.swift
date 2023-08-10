//
//  1991.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/08/10.
//

import Foundation

func dfs(_ node: String) {
    result[0] += node
    
    if graph[node]![0] != "." {
        dfs(graph[node]![0])
    }
    
    result[1] += node
    
    if graph[node]![1] != "." {
        dfs(graph[node]![1])
    }
    
    result[2] += node
}

let n = Int(readLine()!)!
var graph: [String: [String]] = [:]
for _ in 0..<n {
    let arr = readLine()!.split { $0 == " " }.map { String($0) }
    graph[arr[0]] = [arr[1], arr[2]]
}

var result: [String] = ["", "", ""]

dfs("A")

print(result.joined(separator: "\n"))
