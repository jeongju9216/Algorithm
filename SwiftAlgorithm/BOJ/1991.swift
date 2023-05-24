//
//  1991.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/04.
//

//1991 트리 순회
import Foundation

func dfs(_ node: String) {
    let left = graph[node]![0]
    let right = graph[node]![1]
    
    results[0] += node
    if left != "." {
        dfs(left)
    }
    results[1] += node
    if right != "." {
        dfs(right)
    }
    results[2] += node
}
 
let n = Int(readLine()!)!
var graph: [String: [String]] = [:]
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { String($0) }
    graph[input[0]] = [input[1], input[2]]
}

var results: [String] = ["", "", ""]
dfs("A")

for result in results {
    print(result)
}
